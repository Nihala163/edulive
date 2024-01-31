import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ReviewUI extends StatelessWidget {
  final String image, name, date, comment;
  final double rating;
  final void Function() onTttap;
  final bool isLess;

  const ReviewUI({
    super.key,
    required this.image,
    required this.name,
    required this.date,
    required this.comment,
    required this.rating,
    required this.onTttap,
    this.isLess = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 45.h,
              width: 45.w,
              margin: EdgeInsets.only(right: 16.r),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(44.r)),
            ),
            Expanded(
              child: Text(
                name,
                style: GoogleFonts.poppins(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          children: [
            RatingBar.builder(
              itemSize: 18,
              ignoreGestures: true,
              initialRating: rating,
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
          ],
        ),
        Text(
          date,
          style: GoogleFonts.poppins(fontSize: 16.sp),
        ),
        SizedBox(
          height: 8.h,
        ),
        GestureDetector(
            onTap: onTttap,
            child: isLess
                ? Text(
                    comment,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                        fontSize: 16.sp, color: Colors.brown),
                  )
                : Text(
                    comment,
                    style: GoogleFonts.poppins(
                        fontSize: 16.sp, color: Colors.brown),
                  )),
      ],
    );
  }
}
