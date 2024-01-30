import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'Admin/Video list.dart';
import 'Admin/View user login.dart';
import 'Admin/View user profile.dart';
import 'Quiz/quizViewuser.dart';
import 'UserLogin/UserRegister.dart';
import 'UserLogin/bottom navigaton Dashbord.dart';
import 'feedback_and_rating/achievementTrack.dart';
import 'feedback_and_rating/feedBack.dart';
import 'feedback_and_rating/reviewList.dart';
import 'feedback_and_rating/scoreClass.dart';
import 'feedback_and_rating/scoreboard.dart';
import 'firebase_options.dart';
import 'login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) =>  MaterialApp(debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:DashBoard(),
    ),
      designSize: Size(390, 844),
    );
  }
}

