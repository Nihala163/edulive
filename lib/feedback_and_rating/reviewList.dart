
import 'package:edulive/feedback_and_rating/reviewClass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewList extends StatefulWidget {
  const ReviewList({super.key});

  @override
  State<ReviewList> createState() => _ReviewListState();
}

class _ReviewListState extends State<ReviewList> {
  bool isMore = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios_sharp),
        ),
        title: Text("Reviews"),
      ),
      body: Container(
        padding:
            EdgeInsets.only(top: 20.r, bottom: 2.r, left: 16.r, right: 0.r),
        child: ListView.separated(
          itemBuilder: (context, index) {
            return ReviewUI(
              image: 'reviewAssets/rOne.jpg',
              name: 'Username',
              date: "23 Jan 2024",
              comment:
                  'Rating Bar can be used in three ways.  Rating Bar can be used in three ways.Rating Bar can be used in three ways.Rating Bar can be used in three ways.Rating Bar can be used in three ways.Rating Bar can be used in three ways.Rating Bar can be used in three ways.',
              rating: 4.5,
              onTttap: () {
                setState(() {
                  isMore = !isMore;
                  print(isMore);
                });
              },
              isLess: isMore,
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider();
          },
          itemCount: 4,
        ),
      ),
    );
  }
}
