import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edulive/adminProgress/studentProgress.dart';
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
      backgroundColor: Colors.cyan[100],
      appBar: AppBar(
        backgroundColor: Colors.cyan[100],
        surfaceTintColor: Colors.cyan[100],
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
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection("UserRegister").get(),
    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (snapshot.hasError) {
        return Center(
          child: Text('Error: ${snapshot.error}'),
        );
      }
      final user = snapshot.data?.docs ?? [];

      return ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 15).r,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StudentProgress(id:user[index].id),
                    ));
              },
              child: Container(
                height: 80.h,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 5.0,
                          offset: const Offset(0.0, 5.0)),
                    ],
                    borderRadius: BorderRadius.circular(10).r,
                    color: Colors.cyan[200]),
                child: Center(
                  child: ListTile(
                    leading: Image.network(
                        'https://cdn0.iconfinder.com/data/icons/kameleon-free-pack-rounded/110/Student-3-1024.png'),
                    title: Text(
                      user[index]['Name'],
                      style: GoogleFonts.inter(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                    subtitle: Text(
                       user[index]['Department'],
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
        itemCount: user.length,
      );
    } ),
    );
  }
}
