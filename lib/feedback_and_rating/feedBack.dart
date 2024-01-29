
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FeedbackOne extends StatefulWidget {
  const FeedbackOne({super.key});

  @override
  State<FeedbackOne> createState() => _FeedbackOneState();
}

class _FeedbackOneState extends State<FeedbackOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    height: 600.h,
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Please State your review',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600, fontSize: 24.sp),
                          ),
                          RatingBar.builder(
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
                              print(rating);
                            },
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              Text(
                                'Comment',
                                style: GoogleFonts.poppins(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'describe here',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                            ),
                            maxLines: 6,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return FeedbackOne();
                                },));
                              },
                              child: Text(
                                'Save',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 24.sp),
                              ))
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: Text('Go for Reivew')),
      ),
    );
  }
}

