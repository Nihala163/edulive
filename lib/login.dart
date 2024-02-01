import 'package:edulive/Adminlogin/AdminLogin.dart';
import 'package:edulive/UserLogin/UserSighnup(1).dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Logins extends StatefulWidget {
  const Logins({super.key});

  @override
  State<Logins> createState() => _LoginsState();
}

class _LoginsState extends State<Logins> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 140.h,
              width: 140.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: AssetImage("assets/LOGO.png"),
                      fit: BoxFit.fill)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return Adminlogin();
                }));
              },
                child: Text('Admin Login'),
                style:ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  foregroundColor: Colors.white,
                    backgroundColor: Colors.deepPurple) ,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return UserLogin();
                }));
              },
                child: Text('User Login'),
                style:ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.yellow) ,),
            ),
          ],
        ),
      ),
    );
  }
}
