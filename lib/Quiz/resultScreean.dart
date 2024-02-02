import 'package:edulive/addPdf/AddNote.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.score, required this.total});
  final score;
  final total;

  @override
  Widget build(BuildContext context) {
    //  final AnimationController _controller=AnimationController(vsync:   vsync);
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
                  // Lottie.network(
                  //     'https://lottie.host/dd62434d-82fd-4587-baf2-bd6650edac07/iO8JO30mi3.json'),
                  Lottie.asset(
                      score == 0
                          ? 'assets/Lotties/NoRes.json'
                          : 'assets/Lotties/Victory.json',
                      height: 200.h,
                      width: 200.w,
                      frameRate: FrameRate(1000)),
                  Center(
                    child: Text(
                      score == 0 ? 'No points try again..!' : 'Your Score is',
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
