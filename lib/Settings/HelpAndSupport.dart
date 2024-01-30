import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpAndSupport extends StatefulWidget {
  const HelpAndSupport({super.key});

  @override
  State<HelpAndSupport> createState() => _HelpAndSupportState();
}

class _HelpAndSupportState extends State<HelpAndSupport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back_ios)),
          title: Text("TechSupport",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600, fontSize: 25.sp)),
          centerTitle: true),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.only(top: 30.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                    radius: 50.r, backgroundImage: AssetImage("assets/cc.png")),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30.h),
            child: Container(
              width: 330.w,
              height: 500.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 2)),
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.only(top: 20.h, left: 20),
                  child: Row(
                    children: [
                      Text("Your Name",
                          style: GoogleFonts.poppins(
                              fontSize: 15, color: Colors.grey)),
                    ],
                  ),
                ),
                SizedBox(
                  width: 300.w,
                  height: 50.h,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r)))),
                  ),
                ),
                //
                //
                Padding(
                  padding: EdgeInsets.only(top: 20.h, left: 20),
                  child: Row(
                    children: [
                      Text("Email",
                          style: GoogleFonts.poppins(
                              fontSize: 15, color: Colors.grey)),
                    ],
                  ),
                ),
                SizedBox(
                  width: 300.w,
                  height: 50.h,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r)))),
                  ),
                ),
                //
                //
                Padding(
                  padding: EdgeInsets.only(top: 20.h, left: 20),
                  child: Row(
                    children: [
                      Text("Phone number",
                          style: GoogleFonts.poppins(
                              fontSize: 15, color: Colors.grey)),
                    ],
                  ),
                ),
                SizedBox(
                  width: 300.w,
                  height: 50.h,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r)))),
                  ),
                ),
                //
                //
                Padding(
                  padding: EdgeInsets.only(top: 20.h, left: 20),
                  child: Row(
                    children: [
                      Text("Problem description",
                          style: GoogleFonts.poppins(
                              fontSize: 15, color: Colors.grey)),
                    ],
                  ),
                ),
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                        maxLines: 5,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r)))),
                  ),
                ),
              ]),
            ),
          ),
          //

          Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {},
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
                      "Send",
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
