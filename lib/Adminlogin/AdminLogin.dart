import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../adminDash.dart';

class Adminlogin extends StatefulWidget {
  const Adminlogin({
    super.key,
  });

  @override
  State<Adminlogin> createState() => _AdminloginState();
}

class _AdminloginState extends State<Adminlogin> {
  final formkey = GlobalKey<FormState>();
  bool _obscureText = true;

  var Name = TextEditingController();
  var Pass = TextEditingController();
  login() {
    if (Name.text == 'kmo@gmail.com' && Pass.text == '123') {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return Adminlogin();
        },
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Scaffold(
          backgroundColor: Colors.indigo.shade100,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 50.h),
                  child: SafeArea(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 140.h,
                          width: 140.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: AssetImage("assets/LOGO.png"),
                                  fit: BoxFit.fill)),
                        )
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(
                        20,
                      ),
                      child: Text(
                        "ADMIN LOGIN",
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 20),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 50.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 290.w,
                      child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'empty Username';
                            }
                          },
                          controller: Name,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 10),
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon: Icon(Icons.person),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: "Username",
                              hintStyle: TextStyle(color: Colors.grey))),
                    )
                  ],
                ),
                SizedBox(
                  height: 50.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 290.w,
                      child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'empty password';
                            }
                          },
                          obscureText: _obscureText,
                          controller: Pass,
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon: Icon(Icons.lock),
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 10),
                              suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  },
                                  child: Icon(
                                      _obscureText
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.grey)),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: "Password",
                              hintStyle: TextStyle(color: Colors.grey))),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 120.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 190.w,
                        height: 50.h,
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return  AdminDash();
                            },));
                              // if (formkey.currentState!.validate()) {
                              //   AdminDash();
                              // }
                            },
                            child: Text(
                              "LOGIN",
                              style: TextStyle(color: Colors.white),
                            )),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                            color: Colors.indigo.shade900),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
