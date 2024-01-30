import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

const whiteone = Color(0xfff5f6f9);
const customBalck = Color(0xff000000);
const white = Color(0xffFFFFFF);

class AdminDash extends StatefulWidget {
  const AdminDash({super.key});

  @override
  State<AdminDash> createState() => _AdminDashState();
}

class _AdminDashState extends State<AdminDash> {
  List users = ["Students"];
  List logo = [
    "assets/std.png",
  ];
  List images = [
    "assets/video.png",
    "assets/quiz.png",
    "assets/note.png",
    "assets/banner.png",
  ];

  List services = [
    "Manage Video",
    "Manage Quiz ",
    "Add Notes",
    "Add offers",
  ];



  List Screens = [
    Text("add video"),
    Text("quizScreen"),
    Text("note screen"),
    Text("banner"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: whiteone,
        title: const AppText(
            text: "hi, Admin",
            weight: FontWeight.w500,
            size: 18,
            textcolor: customBalck),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          InkWell(
            onTap: () {},
            child: Stack(
              children: [
                const Icon(
                  Icons.notifications_none_sharp,
                  color: customBalck,
                  size: 30,
                ),
                Positioned(
                    // notification Icon......
                    left: 17.r,
                    top: 5.r,
                    child: CircleAvatar(
                      radius: 6.r,
                      backgroundColor: Colors.red,
                    )),
              ],
            ),
          ),
          SizedBox(
            width: 20.w,
          )
        ],
      ),
      backgroundColor: whiteone,
      body: ListView(children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: const AppText(
              text: "Users",
              weight: FontWeight.w400,
              size: 20,
              textcolor: customBalck),
        ),
        SizedBox(
          height: 10.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 12, mainAxisSpacing: 12),
            itemCount: users.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => StudentList(),
                  //     ));
                },
                child: Container(
                  height: 300.h,
                  width: 100.w,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 5.0,
                        offset: const Offset(0.0, 3.0)),
                  ], borderRadius: BorderRadius.circular(15).r, color: white),
                  child: Padding(
                    padding: const EdgeInsets.all(5).r,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            logo[index],
                            width: 40.w,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          AppText(
                              text: users[index],
                              textcolor: customBalck,
                              size: 15.sp,
                              weight: FontWeight.w500),
                        ]),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: const AppText(
              text: "Categories",
              weight: FontWeight.w400,
              size: 20,
              textcolor: customBalck),
        ),
        SizedBox(
          height: 10.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12),
            itemCount: services.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Screens[index],
                      ));
                },
                child: Container(
                  height: 300.h,
                  width: 100.w,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 5.0,
                        offset: const Offset(0.0, 3.0)),
                  ], borderRadius: BorderRadius.circular(15).r, color: white),
                  child: Padding(
                    padding: const EdgeInsets.all(5).r,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            images[index],
                            width: 40.w,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          AppText(
                              text: services[index],
                              textcolor: customBalck,
                              size: 15.sp,
                              weight: FontWeight.w500),
                        ]),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
      ]),
    );
  }
}

class AppText extends StatelessWidget {
  const AppText(
      //Custom Text Widget.....
      {super.key,
      required this.text,
      required this.weight,
      required this.size,
      required this.textcolor});

  final String text;
  final FontWeight weight;
  final double size;
  final Color textcolor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
          fontSize: size.sp, color: textcolor, fontWeight: weight),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }
}
