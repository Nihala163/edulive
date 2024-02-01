import 'package:edulive/addPdf/AddNote.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.score, required this.total});
  final score;
  final total;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.indigo[900],
          // image: DecorationImage(
          //     fit: BoxFit.cover,
          //     image: AssetImage(
          //       'assets/bg.png',
          //     ))
        ),
        child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Center(
                    child: Text(
                      'Your Score is',
                      style: TextStyle(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w500,
                          color: white),
                    ),
                  ),
                  Text(
                    '${score * 10}/${total * 10}',
                    style: TextStyle(
                        fontSize: 30.sp,
                        fontWeight: FontWeight.w500,
                        color: white),
                  )
                ],
              )
            ]),
      ),
    );
  }
}
