import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'View user profile.dart';

class Viewuserlogin extends StatefulWidget {
  const Viewuserlogin({super.key});

  @override
  State<Viewuserlogin> createState() => _ViewuserloginState();
}

class _ViewuserloginState extends State<Viewuserlogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f6f9),
      appBar: AppBar(
        backgroundColor: Color(0xfff5f6f9),
        surfaceTintColor: Color(0xfff5f6f9),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.arrow_back_ios),
            Text(
              "All Students",
              style: GoogleFonts.inter(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            SizedBox(
              width: 20.w,
            )
          ],
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10).r,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Viewuserprofile(),
                    ));
              },
              child: Container(
                height: 80.h,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 5.0.r,
                          offset: const Offset(0.0, 3.0)),
                    ],
                    borderRadius: BorderRadius.circular(15).r,
                    color: Colors.white),
                child: Center(
                  child: ListTile(
                    leading: Image.network(
                        'https://cdn0.iconfinder.com/data/icons/kameleon-free-pack-rounded/110/Student-3-1024.png'),
                    title: Text(
                      "student name",
                      style: GoogleFonts.inter(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                    subtitle: Text(
                      "Department name",
                      style: GoogleFonts.inter(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: 20,
      ),
    );
  }
}
