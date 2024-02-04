import 'package:edulive/UserLogin/User%20Sign%20or%20Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen>
 with SingleTickerProviderStateMixin
{
  @override
  void initState(){
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 5),(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>const SignOrLogin()));
    });
  }
  @override
  void dispose(){
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    overlays: SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(width: double.infinity,
      decoration: const BoxDecoration(gradient: LinearGradient
        (colors: [Colors.blue,Colors.pink],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft
      )
      ),
        child: const Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage("assets/LOGO.png"))

        ],),
      ),
    );
  }
}
