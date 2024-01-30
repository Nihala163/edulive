
import 'package:edulivekmo/feedbackAndRating/test_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


// import 'package:percent_indicator/circular_percent_indicator.dart';
// import 'package:percent_indicator/linear_percent_indicator.dart';

class ProgressGoOne extends StatefulWidget {
  const ProgressGoOne({super.key});

  @override
  State<ProgressGoOne> createState() => _ProgressGoOneState();
}

class _ProgressGoOneState extends State<ProgressGoOne> {
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
          );},
        separatorBuilder: (context, index) {
          return Divider();
        }, itemCount: 7,
      ),
    );
  }
}

