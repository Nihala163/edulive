import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pinput/pinput.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({super.key});

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  final defaultPinTheme = PinTheme(
    width: 50.h,
    height: 50.w,
    textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey, width: 2),
      borderRadius: BorderRadius.circular(8),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.only(top: 80.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 250.h,
                  width: 250.w,
                  decoration: BoxDecoration(
                      image:
                          DecorationImage(image: AssetImage("assets/Mob.png"))),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 50.h, left: 50.w, right: 50.w),
            child: IntlPhoneField(

              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              initialCountryCode: 'IN',
              onChanged: (phone) {
                if (kDebugMode) {
                  print(phone.completeNumber);
                }
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 50.h),
            child: Align(
                alignment: Alignment.center,
                child: Pinput(
                    length: 5,
                    defaultPinTheme: defaultPinTheme)), // otp field.........
          ),
          Padding(
            padding: EdgeInsets.only(top: 100.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => ForgottNewpassword(),
                    //     ));
                  },
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
                      "Sent code",
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
        ]),
      ),
    );
  }
}
