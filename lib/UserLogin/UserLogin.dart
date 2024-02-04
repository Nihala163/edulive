import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../forgott password/ForgottPassword.dart';
import 'UserSighnup(1).dart';
import 'bottom navigaton Dashbord.dart';

class UserLogin1 extends StatefulWidget {
  const UserLogin1({super.key});

  @override
  State<UserLogin1> createState() => _UserLogin1State();
}

class _UserLogin1State extends State<UserLogin1> {
  var id;
  var name;
  var email;
  var phone;
  var path;

  void loginuser() async {
    final user = await FirebaseFirestore.instance
        .collection('UserSignup')
        .where('Mobile', isEqualTo: phonenumber.text)
        .where('Password', isEqualTo: password.text)
        .get();
    print("inside");
    if (user.docs.isNotEmpty) {
      id = user.docs[0].id;
      name = user.docs[0]['Email'];
      email = user.docs[0]['Name'];
      phone = user.docs[0]['Mobile'];
      path = user.docs[0]['Profilepath'];
      SharedPreferences data = await SharedPreferences.getInstance();
      data.setString('id', id);
      data.setString('name', name);
      data.setString('email', email);
      data.setString('phone', phone);
      data.setString('paath', path);

      print("logined");

      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return DashBoard();
        },
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            "username and password error",
            style: TextStyle(color: Colors.red),
          )));
    }
  }
  final _formfield = GlobalKey<FormState>();

  final password = TextEditingController();
  final phonenumber = TextEditingController();

  bool passToggle = true;
  bool _passwordValid = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff5f6f9),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              surfaceTintColor: Color(0xfff5f6f9),
              backgroundColor: Color(0xfff5f6f9),
              expandedHeight: 200.0.h,
              floating: false,
              pinned: true,
              leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_back_ios)),
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                titlePadding: EdgeInsets.only(left: 0).r,
                title: Text(
                  'Welcome Back',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 19.sp,
                      color: Colors.indigo.shade900),
                ),
                background: Image.asset("assets/LOGO.png"),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  // Build your list items here
                  return Form(
                    key: _formfield,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 15).r,
                          child: Text(
                            'Phone number',
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: 17.sp,
                                color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 30, right: 30, top: 5)
                                  .r,
                          child: TextFormField(
                            controller: phonenumber,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText: 'Enter Phone number',
                                hintStyle: GoogleFonts.poppins(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff878787)),
                                contentPadding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 15)
                                    .r,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xff878787)),
                                  borderRadius: BorderRadius.circular(8).r,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xff878787)),
                                  borderRadius: BorderRadius.circular(8).r,
                                ),
                                border: const OutlineInputBorder()),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter valied phone number";
                              }
                            },
                          ),
                        ),

                        //============================================================================================================================

                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 20).r,
                          child: Text(
                            'Password',
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: 17.sp,
                                color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 30, right: 30, top: 5)
                                  .r,
                          child: TextFormField(
                            controller: password,
                            obscureText: true,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: 'Enter Password',
                              errorText: _passwordValid
                                  ? null
                                  : 'Passwords do not match',
                              hintStyle: GoogleFonts.poppins(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff878787)),
                              contentPadding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 15)
                                  .r,
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Color(0xff878787)),
                                borderRadius: BorderRadius.circular(8).r,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Color(0xff878787)),
                                borderRadius: BorderRadius.circular(8).r,
                              ),
                              border: const OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Password";
                              } else if (value!.isEmpty) {
                                return "Enter Password";
                              } else if (password.text.length < 6) {
                                return "Password Length Should not be less\nthan 6 characters";
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 220.w),
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return Forgottpassword();
                                  },
                                ));
                              },
                              child: Text(
                                "Forgot Password ?",
                                style: TextStyle(color: Colors.indigo.shade900),
                              )),
                        ),

                        //======================================================================================================================================

                        //======================================================================================================================================

                        SizedBox(
                          height: 100,
                        ),

                        Align(
                          alignment: Alignment.center,
                          child: InkWell(
                            onTap: () {
                              if (_formfield.currentState!.validate()) {
                                print("Touched");
                                loginuser();
                              }
                            },
                            child: Container(
                              height: 40.h,
                              width: 330.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8).r,
                                  color: Colors.indigo.shade900),
                              child: Center(
                                child: Text(
                                  'LOGIN',
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 17.sp,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have account?",
                              style: GoogleFonts.poppins(fontSize: 15),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return UserLogin();
                                    },
                                  ));
                                },
                                child: Text(
                                  "Create a new account",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                      color: Colors.indigo.shade900),
                                ))
                          ],
                        )
                      ],
                    ),
                  );
                },
                childCount: 1, // Change this to the number of items you want
              ),
            )
          ],
        ));
  }


}
