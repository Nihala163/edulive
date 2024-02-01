
import 'package:edulive/feedback_and_rating/scoreClass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgressGoOne extends StatefulWidget {
  const ProgressGoOne({super.key});

  @override
  State<ProgressGoOne> createState() => _ProgressGoOneState();
}

class _ProgressGoOneState extends State<ProgressGoOne> {
  var value = 0.4;
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
            test: 'Test ${index + 1}',
            score: "${value * 100}/100",
            percent: value,
            circle: value * 100.truncate(),
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
