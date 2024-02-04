import 'package:edulive/Quiz/quizViewuser.dart';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    bool isTop = false;
    return Scaffold(
      backgroundColor: Colors.indigo.shade900,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Stack(
          children: [
            Column(children: [
              Spacer(),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      // Future.delayed(
                      //   Duration(milliseconds: 200),
                      //   () {
                      //     setState(() {
                      //       isTop = true;
                      //     });
                      //     showGeneralDialog(
                      //       transitionDuration: Duration(milliseconds: 1500),
                      //       barrierColor: Colors.transparent,
                      //       transitionBuilder: (context, animation,
                      //           secondaryAnimation, child) {
                      //         Tween<Offset> tween;
                      //         tween =
                      //             Tween(begin: Offset(0, 1), end: Offset.zero);
                      //         return Stack(
                      //           children: [
                      //             SlideTransition(
                      //               position: tween.animate(CurvedAnimation(
                      //                   parent: animation,
                      //                   curve: Curves.easeInOut)),
                      //               child: child,
                      //             ),
                      //           ],
                      //         );
                      //       },
                      //       context: context,
                      //       pageBuilder:
                      //           (context, animation, secondaryAnimation) =>
                      //               Stack(
                      //         children: [
                      //           Align(
                      //             alignment: Alignment.bottomCenter,
                      //             child: Container(
                      //               // child: Center(child: Icon(Icons.close)),
                      //               height: MediaQuery.of(context).size.height /
                      //                   1.5,
                      //               margin: EdgeInsets.all(20),
                      //               alignment: Alignment.bottomCenter,
                      //               decoration: BoxDecoration(
                      //                   color: Colors.white,
                      //                   borderRadius: BorderRadius.only(
                      //                       topLeft: Radius.circular(30),
                      //                       bottomLeft: Radius.circular(30),
                      //                       bottomRight: Radius.circular(30),
                      //                       topRight: Radius.circular(30))),
                      //               padding: EdgeInsets.symmetric(
                      //                   horizontal: 20, vertical: 20),
                      //             ),
                      //           ),
                      //           AnimatedPositioned(
                      //             duration: Duration(milliseconds: 200),
                      //             left: 20,
                      //             top: MediaQuery.sizeOf(context).height / 6,
                      //             // : MediaQuery.sizeOf(context).height / 2,
                      //             child: Material(
                      //               color: Colors.transparent,
                      //               child: Text(
                      //                 'Quiz',
                      //                 style: TextStyle(
                      //                     fontSize: 40,
                      //                     fontWeight: FontWeight.w700,
                      //                     color: Colors.white),
                      //               ),
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     );
                      //   },
                      // );
                      Navigator.pushReplacement(
                          context,
                          PageTransition(
                              duration: Duration(milliseconds: 1000),
                              child: QuizView(),
                              type: PageTransitionType.bottomToTop));
                    },
                    child: Text('Start')),
              ),
            ]),
            AnimatedPositioned(
              duration: Duration(milliseconds: 1500),
              top: isTop == false
                  ? MediaQuery.sizeOf(context).height / 7
                  : MediaQuery.sizeOf(context).height / 2,
              child: Material(
                color: Colors.transparent,
                child: Text(
                  'Quiz',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
