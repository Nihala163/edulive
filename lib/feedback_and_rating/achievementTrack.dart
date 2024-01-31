import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class AchievementTrack extends StatefulWidget {
  const AchievementTrack({super.key});

  @override
  State<AchievementTrack> createState() => _AchievementTrackState();
}

class _AchievementTrackState extends State<AchievementTrack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade100,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios_sharp,
            size: 30,
          ),
        ),
        title: Text(
          'Achievemnt Tracking',
          style: GoogleFonts.poppins(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: LinearPercentIndicator(
            animation: true,
            animationDuration: 1000,
            lineHeight: 50.h,
            progressColor: Colors.indigo.shade900,
            percent: 0.6,
            barRadius: Radius.circular(20),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 100.0),
          child: ClipOval(
            child: Container(
              alignment: Alignment.center,
              height: 300.h,
              width: 300.w,
              decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(100.r)),
              child: Text(
                "Level 1",
                style: GoogleFonts.poppins(
                    fontSize: 34.sp, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: Column(
            children: [
              Text("You Have Completed Level 1",style: GoogleFonts.poppins(fontSize: 18,)),
              Text("Congratulations !",style: GoogleFonts.poppins(fontSize: 18),)
            ],
          ),
        ),

      ]),

    );
  }
}
