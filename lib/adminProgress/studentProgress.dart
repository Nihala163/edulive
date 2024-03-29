
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edulive/Admin/View%20user%20profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

const whiteone = Color(0xfff5f6f9);
const customBalck = Color(0xff000000);
const white = Color(0xffFFFFFF);

class StudentProgress extends StatefulWidget {
  const StudentProgress({super.key, required this.id});
  final id;

  @override
  State<StudentProgress> createState() => _StudentProgressState();
}

double profile_count = 0.9;
double video_count = 0.4;
double quiz_count = 0.7;

class _StudentProgressState extends State<StudentProgress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteone,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        backgroundColor: whiteone,
        title: const AppText(
            text: "Student Status",
            weight: FontWeight.w400,
            size: 18,
            textcolor: customBalck),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 200,
            width: double.infinity,
            child:
                StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("UserRegister")
                        .doc(widget.id)
                        .snapshots(),
                  builder: (context, snapshot) {

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
                    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        "https://t4.ftcdn.net/jpg/05/52/94/89/360_F_552948967_rfWkVCstu3t9ypSnpt2ZePVnuqoi6D6o.jpg"),
                                  ),
                                  SizedBox(
                    height: 10.h,
                                  ),
                                   AppText(
                      text: snapshot.data!['Name'],
                      weight: FontWeight.w400,
                      size: 20,
                      textcolor: customBalck),
                                  const AppText(
                      text: "B com",
                      weight: FontWeight.w400,
                      size: 17,
                      textcolor: customBalck)
                                ]);
                  }
                ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 5.0,
                        offset: const Offset(0.0, 3.0)),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.r)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 20.h),
                child: Column(children: [
                  const Align(
                      alignment: Alignment.bottomLeft,
                      child: AppText(
                          text: "Profile Completed ",
                          weight: FontWeight.w500,
                          size: 22,
                          textcolor: customBalck)),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Viewuserprofile(id: widget.id),));
                  },
                    child: CircularPercentIndicator(
                      radius: 100,
                      backgroundColor: Colors.grey.shade300,
                      lineWidth: 30,
                      //arcBackgroundColor:  Color(0xff50D8D7),
                      // fillColor: Color(0xff50D8D7),
                      progressColor: Color(0xff87CEEB),
                      animation: true,
                      animationDuration: 2000,
                      percent: profile_count,
                      center: Text(
                        "${profile_count * 100}%",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                    ),
                  ),
                ]),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 5.0,
                              offset: const Offset(0.0, 3.0)),
                        ],
                        borderRadius: BorderRadius.circular(30.r)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 25.h, vertical: 20.h),
                      child: Column(children: [
                        const Align(
                            alignment: Alignment.bottomLeft,
                            child: AppText(
                                text: "Video watch",
                                weight: FontWeight.w500,
                                size: 15,
                                textcolor: customBalck)),
                        const SizedBox(
                          height: 20,
                        ),
                        CircularPercentIndicator(
                          radius: 50,
                          backgroundColor: Colors.grey.shade300,
                          lineWidth: 10,
                          //arcBackgroundColor:  Color(0xff50D8D7),
                          // fillColor: Color(0xff50D8D7),
                          progressColor: Colors.greenAccent,
                          animation: true,
                          animationDuration: 2000,
                          percent: video_count,
                          center: Text(
                            "${video_count * 100}%",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.0),
                          ),
                          circularStrokeCap: CircularStrokeCap.round,
                        ),
                      ]),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 5.0,
                              offset: const Offset(0.0, 3.0)),
                        ],
                        borderRadius: BorderRadius.circular(30.r)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 25.h, vertical: 20.h),
                      child: Column(children: [
                        const Align(
                            alignment: Alignment.bottomLeft,
                            child: AppText(
                                text: "Quiz OverView",
                                weight: FontWeight.w500,
                                size: 15,
                                textcolor: customBalck)),
                        const SizedBox(
                          height: 20,
                        ),
                        CircularPercentIndicator(
                          radius: 50,
                          backgroundColor: Colors.grey.shade300,
                          lineWidth: 10,
                          //arcBackgroundColor:  Color(0xff50D8D7),
                          // fillColor: Color(0xff50D8D7),
                          progressColor: Colors.yellow,
                          animation: true,
                          animationDuration: 2000,
                          percent: quiz_count,
                          center: Text(
                            "${quiz_count * 100}%",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.0),
                          ),
                          circularStrokeCap: CircularStrokeCap.round,
                        ),
                      ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50.h,
            width: double.infinity,
          )
        ],
      ),
    );
  }
}

class AppText extends StatelessWidget {
  const AppText(
      //Custom Text Widget.....
      {super.key,
      required this.text,
      required this.weight,
      required this.size,
      required this.textcolor});

  final String text;
  final FontWeight weight;
  final double size;
  final Color textcolor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
          fontSize: size.sp, color: textcolor, fontWeight: weight),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }
}
