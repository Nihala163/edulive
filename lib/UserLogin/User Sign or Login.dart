import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'UserLogin.dart';
import 'UserSighnup(1).dart';
import 'UserSighup(2).dart';

class SignOrLogin extends StatefulWidget {
  const SignOrLogin({super.key});

  @override
  State<SignOrLogin> createState() => _SignOrLoginState();
}

class _SignOrLoginState extends State<SignOrLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff5f6f9),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              surfaceTintColor: Color(0xfff5f6f9),
              backgroundColor: Color(0xfff5f6f9),
              expandedHeight: 300.0.h,
              floating: false,
              pinned: true,
              leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_back_ios)),
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                titlePadding: EdgeInsets.only(left: 0).r,
                title: Text(
                  'WELCOME',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 19.sp,
                      color: Colors.black),
                ),
                background: Image.asset("assets/LOGO.png"),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  // Build your list items here
                  return Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 100,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return UserLogin();
                                },
                              ));
                            },
                            child: Container(
                              height: 40.h,
                              width: 200.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8).r,
                                  color: Colors.indigo.shade900),
                              child: Center(
                                child: Text(
                                  'SIGN UP',
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 17.sp,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 100,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return UserLogin1();
                                },
                              ));
                            },
                            child: Container(
                              height: 40.h,
                              width: 200.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8).r,
                                  color: Colors.indigo.shade900),
                              child: Center(
                                child: Text(
                                  'LOGIN',
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 17.sp,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                childCount: 1, // Change this to the number of items you want
              ),
            )
          ],
        ));
  }
}
