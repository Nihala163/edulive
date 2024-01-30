import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class FeedBackPage extends StatefulWidget {
  const FeedBackPage({super.key});

  @override
  State<FeedBackPage> createState() => _FeedBackPageState();
}

class _FeedBackPageState extends State<FeedBackPage> {
  var feednote = TextEditingController();
  double starboy = 0;
  final date = DateTime.now();

  ReviewMain() {
    FirebaseFirestore.instance.collection('ReviewCollection').add({
      "dataname": "name",
      "feednote": feednote.text,
      "starvalue": starboy,
      "datehello": DateFormat('dd/mm/yy').format(date),
    }).then((value) {
      print('sign uppp successfull');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade50,
        leading: Icon(Icons.arrow_back_ios_new_sharp),
        title: Text(
          'Review',
          style: GoogleFonts.poppins(fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(children: [
          SizedBox(
            height: 30.h,
          ),
          Row(
            children: [
              Text(
                'Please share your experience',
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: TextFormField(
              controller: feednote,
              decoration: InputDecoration(
                labelText: 'describe here',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
              ),
              maxLines: 6,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  starboy = rating;
                });
              },
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: ElevatedButton(
                onPressed: () {
                  print(starboy);
                  print(feednote.text);
                  ReviewMain();
                },
                child: Text(
                  'Save',
                  style:
                      TextStyle(fontWeight: FontWeight.w400, fontSize: 24.sp),
                )),
          )
        ]),
      ),
    );
  }
}
