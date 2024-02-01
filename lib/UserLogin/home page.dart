import 'package:carousel_slider/carousel_slider.dart';
import 'package:edulive/Admin/User%20video%20list.dart';
import 'package:edulive/todo/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Admin/Video list.dart';
import '../Quiz/quizViewuser.dart';
import '../Settings/Settings.dart';
import '../addPdf/NoteList.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> carouselItems = [
    'https://strapi.dhiwise.com/uploads/618fa90c201104b94458e1fb_647ecd43c5092e1c431f22fd_Flutter_App_Development_A_Step_by_Step_Tutorial_With_Dhi_Wise_E2_80_99s_Flutter_Builder_OG_Image_62b760b8fe.jpg',
    'https://www.talentica.com/wp-content/uploads/2021/04/Firebase-blog-feature-image-1.jpg',
    'https://d3kqdc25i4tl0t.cloudfront.net/articles/content/fbcd33859f5566908eabadc6cfb27228_hero.jpeg',
    'https://www.talentica.com/wp-content/uploads/2021/04/Firebase-blog-feature-image-1.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications_active))
        ],
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'EduPort',
          style: GoogleFonts.poppins(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo.shade900,
      ),
      drawer: Drawer(
        child: ListView(children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.indigo.shade900),
            accountName: Text("Name"),
            accountEmail: Text("Email"),
            currentAccountPicture: InkWell(
                onTap: () {},
                child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    backgroundImage: NetworkImage(
                        "https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg"))),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return Settings();
                },
              ));
            },
            leading: Icon(Icons.person),
            title: Text("Settings", style: TextStyle(fontSize: 20)),
          ),
          ListTile(
            onTap: () {},
            title: Text("Logout", style: TextStyle(fontSize: 20)),
            leading: Icon(Icons.exit_to_app),
          )
        ]),
        backgroundColor: Color(0xffCFE2FF),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: CarouselSlider(
              items: carouselItems
                  .map((item) => Container(
                        child: Center(
                          child: Image.network(item),
                        ),
                      ))
                  .toList(),
              options: CarouselOptions(
                height: 200,
                autoPlay: true,
              ),
            ),
          ),
          //
          //
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 30.w, bottom: 10.h),
            child: Row(children: [
              Text(
                "Category",
                style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.w600),
              )
            ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 290.h,
                  width: 340.w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 5.0,
                            offset: const Offset(0.0, 3.0)),
                      ]),
                  child: GridView.count(
                    primary: false,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    crossAxisCount: 3,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(8),
                        color: Colors.white,
                        child: Column(
                          children: [
                            InkWell(onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return QuizView();
                              },));
                            },
                              child: Container(
                                height: 50,
                                width: 70,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.3),
                                          blurRadius: 5.0,
                                          offset: const Offset(0.0, 3.0)),
                                    ],
                                    image: DecorationImage(
                                        image: AssetImage("assets/quiz.png"),
                                        fit: BoxFit.fill),
                                    color: Colors.grey.shade200),
                              ),
                            ),
                            Text("Quiz",
                                style: TextStyle(fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                      InkWell(onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return NoteList();
                        },));
                      },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          color: Colors.white,
                          child: Column(
                            children: [
                              Container(
                                height: 50,
                                width: 70,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.3),
                                          blurRadius: 5.0,
                                          offset: const Offset(0.0, 3.0)),
                                    ],
                                    image: DecorationImage(
                                        image: AssetImage("assets/std.png"),
                                        fit: BoxFit.fill),
                                    color: Colors.grey.shade200),
                              ),
                              Text("Material",
                                  style: TextStyle(fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        color: Colors.white,
                        child: Column(
                          children: [
                            InkWell(onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return VideoList();
                              },));
                            },
                              child: Container(
                                height: 50,
                                width: 70,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.3),
                                          blurRadius: 5.0,
                                          offset: const Offset(0.0, 3.0)),
                                    ],
                                    image: DecorationImage(
                                        image: AssetImage("assets/video.png"),
                                        fit: BoxFit.fill),
                                    color: Colors.grey.shade200),
                              ),
                            ),
                            Text("Video",
                                style: TextStyle(fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                      InkWell(onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return AddTodo();
                        },));
                      },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          color: Colors.white,
                          child: Column(
                            children: [
                              Container(
                                height: 50,
                                width: 70,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.3),
                                          blurRadius: 5.0,
                                          offset: const Offset(0.0, 3.0)),
                                    ],
                                    image: DecorationImage(
                                        image: AssetImage("assets/todo.png"),
                                        fit: BoxFit.fill),
                                    color: Colors.grey.shade200),
                              ),
                              Text("Todo",
                                  style: TextStyle(fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        color: Colors.white,
                        child: Column(
                          children: [
                            Container(
                              height: 50,
                              width: 70,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.3),
                                        blurRadius: 5.0,
                                        offset: const Offset(0.0, 3.0)),
                                  ],
                                  image: DecorationImage(
                                      image: AssetImage("assets/Com.png"),
                                      fit: BoxFit.fill),
                                  color: Colors.grey.shade200),
                            ),
                            Text("Complete",
                                style: TextStyle(fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        color: Colors.white,
                        child: Column(
                          children: [
                            Container(
                              height: 50,
                              width: 70,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.3),
                                        blurRadius: 5.0,
                                        offset: const Offset(0.0, 3.0)),
                                  ],
                                  image: DecorationImage(
                                      image: AssetImage("assets/Tipss.png"),
                                      fit: BoxFit.fill),
                                  color: Colors.grey.shade200),
                            ),
                            Text("Tips",
                                style: TextStyle(fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                    ],
                  ))
            ],
          ),
          //
          //
          Padding(
            padding: EdgeInsets.only(left: 30.w, bottom: 10.h, top: 10.h),
            child: Row(children: [
              Text(
                "Inspirational",
                style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.w600),
              )
            ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 100,
                width: 150,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 5.0,
                      offset: const Offset(0.0, 3.0)),
                ], color: Colors.grey.shade400),
              ),
              Container(
                height: 100,
                width: 150,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 5.0,
                      offset: const Offset(0.0, 3.0)),
                ], color: Colors.grey.shade400),
              ),
            ],
          ),
          //
        ],
      ),
    );
  }
}
