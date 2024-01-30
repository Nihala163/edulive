import 'package:edulive/profile/profil%20edit.dart';
import 'package:edulive/profile/profile%20Tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ProgressTab.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.indigo.shade900,
        body: ListView(children: [
          SizedBox(
            height: 250.h,
            width: double.infinity,
            child: Column(
              children: [
                SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          )),
                      Text("Profile",
                          style: GoogleFonts.poppins(
                              fontSize: 20, color: Colors.white)),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Editprofiles(),
                                ));
                          },
                          icon: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ))
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 30.h),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(
                            "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg"),
                        radius: 50.r,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(top: 10.h),
                        child: Text(
                          "Name",
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontSize: 15.sp),
                        )),
                  ],
                )
              ],
            ),
          ),
          Container(
            height: 550.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                color: Colors.white),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, top: 20).r,
                  child: Container(
                    height: 50.h,
                    // width: 330.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.r),
                        color: Colors.grey.shade200),
                    child: TabBar(
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.r),
                        color: Colors.indigo.shade900,
                      ),
                      tabs: [
                        Tab(
                            child: Text(
                          'Profile details',
                          style: TextStyle(
                            // color: Colors.white,
                            fontSize: 16.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 0.h,
                          ),
                        )),
                        Tab(
                            child: Text(
                          'progress details',
                          style: TextStyle(
                            // color: Colors.black,
                            fontSize: 16.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 0.h,
                          ),
                        ))
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(children: [ProfileTab(), Progreetab()]),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
