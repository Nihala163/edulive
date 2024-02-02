import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edulive/Quiz/Answer.dart';
import 'package:edulive/Quiz/answerCard.dart';
import 'package:edulive/Quiz/resultScreean.dart';
import 'package:edulive/addQuiz/addQuiz.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuizView extends StatefulWidget {
  const QuizView({super.key});

  @override
  State<QuizView> createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> {
  PageController _pageController = PageController();
  var Question;
  final ScrollController _scrollController = ScrollController();
  List<dynamic> _Question = [];
  var question2;
  var correctAns;
  static int length = 0;

  int? selectedAnswerIndex;
  int questionIndex = 0;
  int score = 0;

  pickAnswer(int value) {
    selectedAnswerIndex = value;
    question2 = questionIndex;
    if (selectedAnswerIndex == correctAns) {
      score++;
      print(score);
    }
    setState(() {});
  }

  void goToNextQuestion() {
    if (questionIndex < length - 1) {
      question2 = questionIndex++;
      selectedAnswerIndex = null;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.indigo[900],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          selectedAnswerIndex != null
              // ? questionIndex == _Question.length - 1
              ? SizedBox()
              : questionIndex == length - 1
                  ? TextButton(
                      onPressed: () {
                        toScore(length);
                        // Navigator.pushReplacement(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => ResultScreen(
                        //           score: score, total: _Question.length),
                        //     ));
                      },
                      child: Text(
                        'Skip',
                        style: TextStyle(
                            color: const Color.fromRGBO(255, 255, 255, 1)),
                      ))
                  : TextButton(
                      onPressed: () {
                        goToNextQuestion();
                        _pageController.nextPage(
                            duration: Duration(milliseconds: 1000),
                            curve: Curves.fastLinearToSlowEaseIn);
                      },
                      child: Text(
                        'Skip',
                        style: TextStyle(
                            color: const Color.fromRGBO(255, 255, 255, 1)),
                      ))
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('questions').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          // if (snapshot.connectionState == ConnectionState.waiting) {
          //   return Align(
          //       alignment: Alignment.topCenter,
          //       child: LinearProgressIndicator());
          // }
          final Question = snapshot.data?.docs ?? [];
          _Question.add(snapshot.data?.docs ?? []);
          length = Question.length;

          if (snapshot.hasData) {
            return Stack(
              children: [
                // RotatedBox(
                //   quarterTurns: 1,
                //   child: Image.asset(
                //     'assets/bg.png',
                //     fit: BoxFit.cover,
                //     height: MediaQuery.of(context).size.height,
                //   ),
                // ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    alignment: Alignment.topCenter,
                    height: MediaQuery.of(context).size.height / 1.5,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: PageView.builder(
                      controller: _pageController,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: Question.length,
                      itemBuilder: (context, index) {
                        // print();
                        correctAns = Question[index]['answer option'];
                        print(correctAns);
                        List<dynamic> options = Question[index]['options'];
                        // options.add();
                        print(options);
                        return Column(children: [
                          Text('Question ${index + 1}/${Question.length}'),
                          SizedBox(
                            height: 10,
                          ),
                          CustomContainer(
                              height: 100,
                              child: Row(
                                children: [
                                  Text('${index + 1}.'),
                                  Text(Question[index]['question'])
                                ],
                              )),
                          Expanded(
                            child: ListView.builder(
                                shrinkWrap: true,
                                controller: _scrollController,
                                // physics: NeverScrollableScrollPhysics(),
                                itemCount: options.length,
                                padding: EdgeInsets.symmetric(vertical: 20),
                                itemBuilder: (BuildContext context, index) {
                                  return Column(
                                    children: [
                                      InkWell(
                                        onTap: selectedAnswerIndex == null
                                            ? () => pickAnswer(index)
                                            : null,
                                        child: AnswerCard(
                                            correctAnswerIndex: correctAns,
                                            currentIndex: index,
                                            isSelected:
                                                selectedAnswerIndex == index,
                                            question: options[index],
                                            selectedAnswerIndex:
                                                selectedAnswerIndex),
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      )
                                    ],
                                  );
                                }),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          selectedAnswerIndex != null
                              ? questionIndex == length - 1
                                  ? ElevatedButton(
                                      style: ButtonStyle(
                                          shape: MaterialStatePropertyAll(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                            Colors.indigo[900],
                                          )),
                                      onPressed: () {
                                        // int length = Question.length;
                                        toScore(length);
                                      },
                                      child: Text(
                                        'View Score',
                                        style: TextStyle(color: white),
                                      ))
                                  : ElevatedButton(
                                      style: ButtonStyle(
                                          shape: MaterialStatePropertyAll(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Colors.indigo.shade900)),
                                      onPressed: () async {
                                        if (selectedAnswerIndex != null) {
                                          goToNextQuestion();
                                          _pageController.nextPage(
                                              duration:
                                                  Duration(milliseconds: 1000),
                                              curve: Curves
                                                  .fastLinearToSlowEaseIn);
                                        }
                                      },
                                      child: Text('Next Question',
                                          style: TextStyle(color: white)))
                              : SizedBox()
                        ]);
                      },
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
            );
          }
          return Align(
              alignment: Alignment.topCenter, child: LinearProgressIndicator());
        },
      ),
    );
  }

  Container CustomContainer({
    double? width,
    double? height,
    Widget? child,
    void Function()? onTap,
  }) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: child,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.indigo.shade900),
          borderRadius: BorderRadius.all(Radius.circular(10).w)),
    );
  }

  void toScore(int length) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) {
          return ResultScreen(score: score, total: length);
        },
      ),
    );
  }
}
