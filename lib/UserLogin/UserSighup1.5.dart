import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:sms_autofill/sms_autofill.dart';

import 'UserSighup(2).dart';

class Sighup15 extends StatefulWidget {
  final String verificationId;

  const Sighup15({Key? key, required this.verificationId}) : super(key: key);

  @override
  State<Sighup15> createState() => _Sighup15State();
}

class _Sighup15State extends State<Sighup15> with CodeAutoFill {
  var otp = "";
  bool isLoading = false;
  TextEditingController otpController = TextEditingController();

  @override
  void initState() {
    super.initState();
    listenForCode();
    checkConnectivity();
  }

  bool _isConnected = true;

  Future<void> checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    setState(() {
      _isConnected = (connectivityResult != ConnectivityResult.none);
    });

    if (!_isConnected) {
      showNoInternetNotification();
    }
  }

  void showNoInternetNotification() {
    Fluttertoast.showToast(
      msg: "Please check your internet connection.",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
  }

  Future<void> verifyOtp() async {
    try {
      setState(() {
        isLoading = true;
      });

      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId,
        smsCode: otpController.text,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      FirebaseFirestore.instance
          .collection("UserSignup")
          .add({"PhoneNumber": otpController}).then(
              (value) => Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return UserSignup();
                    },
                  )));

      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => UserSignup(id: [index].id),
      //   ),
      // );
    } catch (e) {
      if (kDebugMode) {
        print("Error during OTP validation: $e");
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Invalid OTP. Please try again."),
          duration: Duration(seconds: 3),
        ),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back_ios))),
      body: _isConnected
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 250.h,
                        width: 250.w,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/Mob.png"))),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Pinput(
                    controller: otpController,
                    keyboardType: TextInputType.number,
                    length: 6,
                    onChanged: (value) => otp = value,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 100.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: isLoading ? null : verifyOtp,
                        child: Container(
                          height: 50.h,
                          width: 180.w,
                          decoration: BoxDecoration(
                              color: Colors.indigo.shade900,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    blurRadius: 5.0,
                                    offset: const Offset(0.0, 3.0)),
                              ]),
                          child: Center(
                              child: Text(
                            "verify",
                            style: GoogleFonts.poppins(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          )),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("please Check your internet connection."),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      checkConnectivity();
                    },
                    child: const Text('Check Again'),
                  ),
                ],
              ),
            ),
    );
  }

  @override
  void codeUpdated() {
    print('SMS code updated:$code');
    if (code != null && code!.isNotEmpty) {
      setState(() {
        otpController.text = code!;
      });
    }
  }

  @override
  void dispose() {
    SmsAutoFill().unregisterListener();
    super.dispose();
  }
}

@override
void codeUpdated() {
  // TODO: implement codeUpdated
}
