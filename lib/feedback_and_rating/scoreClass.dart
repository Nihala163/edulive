
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TestUI extends StatelessWidget {
  final String test, score;
  final double percent, circle;

  const TestUI({
    super.key,
    required this.test,
    required this.score,
    required this.percent,
    required this.circle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 150.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Text(
                              test,
                              style: GoogleFonts.poppins(
                                  fontSize: 16.sp, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: CircularPercentIndicator(
                                animation: true,
                                animationDuration: 1000,
                                radius: 50.r,
                                lineWidth: 10.w,
                                percent: percent,
                                progressColor: Colors.indigo.shade900,
                                backgroundColor: Colors.purple.shade100,
                                circularStrokeCap: CircularStrokeCap.round,
                                center: Text(
                                  circle.toString(),
                                  style: GoogleFonts.poppins(
                                    fontSize: 30.sp,
                                  ),
                                )),
                          ),
                        ],
                      ),
                      Container(
                        height: 140.h,
                        width: 200.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'My Score',
                              style: GoogleFonts.poppins(
                                  fontSize: 16.sp,
                                  color: Colors.indigo.shade900),
                            ),
                            Text(
                              score,
                              style: GoogleFonts.poppins(
                                  fontSize: 18.sp, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      )
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
