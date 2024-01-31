import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edulive/feedback_and_rating/reviewClass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewList extends StatefulWidget {
  const ReviewList({super.key, this.id});
  final id;

  @override
  State<ReviewList> createState() => _ReviewListState();
}

class _ReviewListState extends State<ReviewList> {
  DocumentSnapshot? user;

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
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('ReviewCollection')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Text("Error${snapshot.error}");
            }
            final user = snapshot.data?.docs ?? [];
            return Container(
              padding: EdgeInsets.only(
                  top: 20.r, bottom: 2.r, left: 16.r, right: 0.r),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return ReviewUI(
                    image: 'reviewAssets/rOne.jpg',
                    name: user![index]['dataname'],
                    date: user![index]['datehello'],
                    comment: user![index]['feednote'],
                    rating: user![index]['starvalue'],
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
                itemCount: user.length,
              ),
            );
          }),
    );
  }
}
