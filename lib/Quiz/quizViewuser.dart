import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuizView extends StatefulWidget {
  const QuizView({super.key});

  @override
  State<QuizView> createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> {
  PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          TextButton(
              onPressed: () {
                _pageController.nextPage(
                    duration: Duration(milliseconds: 1000),
                    curve: Curves.fastLinearToSlowEaseIn);
              },
              child: Text(
                'Skip',
                style: TextStyle(color: const Color.fromRGBO(255, 255, 255, 1)),
              ))
        ],
      ),
      body: Stack(
        children: [
          RotatedBox(
            quarterTurns: 1,
            child: Image.asset(
              'assets/bg.png',
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Container(
                height: MediaQuery.of(context).size.height / 1.5,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                        topRight: Radius.circular(30))),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Column(children: [
                      Text('Question 1/10'),
                      SizedBox(
                        height: 10,
                      ),
                      CustomContainer(
                          height: 100,
                          child: Row(
                            children: [Text('1.'), Text('Question')],
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        child: CustomContainer(
                            height: 50,
                            child: Row(
                              children: [Text('A.'), Text('Option')],
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomContainer(
                          height: 50,
                          child: Row(
                            children: [Text('B.'), Text('Option')],
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      CustomContainer(
                          height: 50,
                          child: Row(
                            children: [Text('C.'), Text('Option')],
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      CustomContainer(
                          height: 50,
                          child: Row(
                            children: [Text('D.'), Text('Option')],
                          )),
                      Spacer(),
                      ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              backgroundColor: MaterialStatePropertyAll(
                                  Color.fromARGB(255, 91, 222, 189))),
                          onPressed: () {
                            _pageController.nextPage(
                                duration: Duration(milliseconds: 1000),
                                curve: Curves.fastLinearToSlowEaseIn);
                          },
                          child: Text('Next Question')),
                      Spacer(),
                    ]);
                  },
                ),
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: 20,
            child: Text(
              'Lets Start',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  Container CustomContainer({double? width, double? height, Widget? child}) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: child,
      decoration: BoxDecoration(
          border: Border.all(color: Color.fromARGB(255, 91, 222, 189)),
          borderRadius: BorderRadius.all(Radius.circular(10))),
    );
  }
}
