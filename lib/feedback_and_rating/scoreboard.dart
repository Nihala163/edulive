import 'package:edulive/feedback_and_rating/scoreClass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Scoreboard extends StatefulWidget {
  const Scoreboard({super.key});

  @override
  State<Scoreboard> createState() => _ScoreboardState();
}

class _ScoreboardState extends State<Scoreboard> {
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
          'Score Board',
          style: GoogleFonts.poppins(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return TestUI(
            test: 'Test 1',
            score: '40/100',
            percent: 0.8.r,
            circle: 40,
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: 7,
      ),
    );
  }
}
