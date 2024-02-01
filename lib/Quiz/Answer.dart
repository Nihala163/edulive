// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/*
  If (no options is chosen)
    all answer cards should have default style
    all buttons should be enabled
  else
    all button should be disabled
    if (correct option is chosen)
      answer should be highlighted as green
    else
      answer should be highlighted as red
      correct answer should be highlighted as green
*/

class AnswerCard extends StatelessWidget {
  const AnswerCard({
    super.key,
    required this.question,
    required this.isSelected,
    required this.currentIndex,
    required this.correctAnswerIndex,
    required this.selectedAnswerIndex,
  });

  final String question;
  final bool isSelected;
  final int? correctAnswerIndex;
  final int? selectedAnswerIndex;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    bool isCorrectAnswer = currentIndex == correctAnswerIndex;
    bool isWrongAnswer = !isCorrectAnswer && isSelected;
    return selectedAnswerIndex != null
        // if one option is chosen
        ? Container(
            height: 50.h,
            padding: const EdgeInsets.all(10.0).w,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 248, 248, 249),
              borderRadius: BorderRadius.circular(10).w,
              border: Border.all(
                color: isCorrectAnswer
                    ? Colors.green
                    : isWrongAnswer
                        ? Colors.red
                        : Colors.indigo.shade900,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    question,
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                isCorrectAnswer
                    ? buildCorrectIcon()
                    : isWrongAnswer
                        ? buildWrongIcon()
                        : const SizedBox.shrink(),
              ],
            ),
          )
        // If no option is selected
        : Container(
            height: 50,
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 254, 254),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.indigo.shade900,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    question,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}

Widget buildCorrectIcon() => const CircleAvatar(
      radius: 12,
      backgroundColor: Colors.green,
      child: Center(
        child: Icon(
          Icons.check,
          color: Colors.white,
        ),
      ),
    );

Widget buildWrongIcon() => const CircleAvatar(
      radius: 12,
      backgroundColor: Colors.red,
      child: Center(
        child: Icon(
          Icons.close,
          color: Colors.white,
        ),
      ),
    );
