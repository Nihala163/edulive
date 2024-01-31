import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edulive/feedback_and_rating/scoreClass.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Scoreboard extends StatefulWidget {
  const Scoreboard({super.key, this.id});
  final id;

  @override
  State<Scoreboard> createState() => _ScoreboardState();
}

class _ScoreboardState extends State<Scoreboard> {
  var value = 0.7;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade100,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios_sharp,
            size: 30,
          ),
        ),
        title: Text(
          'Score Board',
          style: GoogleFonts.poppins(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
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
            return ListView.separated(
              itemBuilder: (context, index) {
                return TestUI(
                  test: 'Test 2',
                  score: "${value * 100}/100",
                  percent: value,
                  circle: value * 100.truncate(),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: user.length,
            );
          }),
    );
  }
}
