import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edulive/Quiz/Answer.dart';
import 'package:edulive/Quiz/answerCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuizView extends StatefulWidget {
  const QuizView({super.key});

  @override
  State<QuizView> createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> {
  PageController _pageController = PageController();
  var Question;

  int? selectedAnswerIndex;
  int questionIndex = 0;
  int score = 0;

  checkAns() {}
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
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('questions').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Align(
                alignment: Alignment.topCenter,
                child: LinearProgressIndicator());
          }
          Question = snapshot.data?.docs ?? [];

          // _correctAnswer.add(Question[Index]['answer option']);
          return Stack(
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
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
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
                    itemCount: Question.length,
                    itemBuilder: (context, index) {
                      var question = snapshot.data!.docs[index].id;
                      print(question);

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
                        SizedBox(
                          height: 20,
                        ),

                        // Expanded(
                        //   child: ListView.builder(
                        //       shrinkWrap: true,
                        //       itemCount: 4,
                        //       itemBuilder: (context, index) {
                        //         return Container(
                        //           // List<dynamic> count = [];
                        //           // count.add(Question[index]['options']);
                        //           // print(count);
                        //           color: Colors.black,
                        //           height: 20,
                        //           width: 100,
                        //         );
                        //       }),
                        // ),

                        InkWell(
                          onTap: () {
                            checkAns();
                          },
                          child: CustomContainer(
                              height: 50,
                              child: Row(
                                children: [
                                  Text('A.${Question[index]['options'][0]}'),
                                ],
                              )),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomContainer(
                            height: 50,
                            child: Row(
                              children: [
                                Text('B.${Question[index]['options'][1]}'),
                              ],
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        CustomContainer(
                            height: 50,
                            child: Row(
                              children: [
                                Text('C.${Question[index]['options'][2]}'),
                              ],
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        CustomContainer(
                            height: 50,
                            child: Row(
                              children: [
                                Text('D.${Question[index]['options'][3]}'),
                              ],
                            )),
                        Spacer(),
                        ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                backgroundColor: MaterialStatePropertyAll(
                                    Color.fromARGB(255, 91, 222, 189))),
                            onPressed: () {
                              _pageController.nextPage(
                                  duration: Duration(milliseconds: 1000),
                                  curve: Curves.fastLinearToSlowEaseIn);
                            },
                            child: Text('Next Question')),
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
        },
      ),
    );
  }

  InkWell CustomContainer({
    double? width,
    double? height,
    Widget? child,
    void Function()? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: child,
        decoration: BoxDecoration(
            border: Border.all(color: Color.fromARGB(255, 91, 222, 189)),
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    );
  }
}
