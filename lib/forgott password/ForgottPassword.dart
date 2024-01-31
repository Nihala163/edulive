import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import 'Forgottnewpassword.dart';

class Forgottpassword extends StatefulWidget {
  const Forgottpassword({super.key});

  @override
  State<Forgottpassword> createState() => _ForgottpasswordState();
}

class _ForgottpasswordState extends State<Forgottpassword> {
  final defaultPinTheme = PinTheme(
    width: 50.h,
    height: 50.w,
    textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.indigo.shade900, width: 2),
      borderRadius: BorderRadius.circular(8),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Row(
                children: [
                  Text(" Forgot \n password ?",
                      style: GoogleFonts.poppins(
                          fontSize: 30, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            SizedBox(
              height: 100.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.w),
              child: Row(
                children: [
                  Text("MobileNumber",
                      style: GoogleFonts.poppins(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.w600))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: SizedBox(
                width: 300.w,
                height: 60.h,
                child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    )),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 30.w, top: 20.h),
              child: Row(
                children: [
                  Text("Enter otp",
                      style: GoogleFonts.poppins(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.w600))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: Align(
                  alignment: Alignment.center,
                  child: Pinput(
                      length: 5,
                      defaultPinTheme: defaultPinTheme)), // otp field.........
            ),
            //
            //
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
          ],
        ),
      ),
    );
  }
}
