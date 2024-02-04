import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel/excel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bottom navigaton Dashbord.dart';

class UserSignup extends StatefulWidget {
  UserSignup({super.key});

  @override
  State<UserSignup> createState() => _UserSignupState();
}

class _UserSignupState extends State<UserSignup> {
  var mob = '';
  void initState() {
    getData();
  }

  var Name;
  var Mobile;
  var Pass;
  var Email;

  Future<void> setData() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    Name = name.text;
    Mobile = mob.simplifyText();
    Pass = password.toString();
    Email = email.toString();

    setState(() {
      spref.setString("Name", Name);
      spref.setString("Number", Mobile);
      spref.setString("Passsword", Pass);
      spref.setString("Email", Email);

      print("sharepfr:$Name");
      print("shareprf:$Mobile");
      print("Shareprf:$Pass");
      print("Shareprf$Email");
    });
    print("Updated");
  }

  //
  //
  Future<void> getData() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    setState(() {
      mob = spref.getString("num")!;
      spref.setString("id", mob);
    });
    //

    print("Updated");
  }

  Future<dynamic> register() async {
    print("Sign");
    await FirebaseFirestore.instance.collection('UserSignup').add({
      "Mobile": mob,
      "Name": name.text,
      "Email": email.text,
      "Profilestatus": 2.bitLength,
      "Password": password.text,
      "Status": 0,
      "Profilepath":
          "https://img.freepik.com/free-vector/male-businessman-character-sitting-office-workplace-computer-monitor-desk_80328-218.jpg"
    }).then((value) => Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return DashBoard();
          },
        )));
    print("...................signup sucsess");
  }

  final _formfield = GlobalKey<FormState>();

  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmpass = TextEditingController();

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
              expandedHeight: 151.0.h,
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
                  'SIGN UP',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 19.sp,
                      color: Colors.black),
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
                          padding: const EdgeInsets.only(left: 20, top: 20).r,
                          child: Text(
                            'Name',
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
                            controller: name,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText: 'Enter Name',
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
                                return "Enter Name";
                              }
                            },
                          ),
                        ),

                        //============================================================================================================================

                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 15).r,
                          child: Text(
                            'E-mail',
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
                            keyboardType: TextInputType.emailAddress,
                            controller: email,
                            // obscureText: true,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText: 'Enter E-mail',
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
                              bool emailvalid = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value!);

                              if (value!.isEmpty) {
                                return "Enter Email";
                              } else if (!emailvalid) {
                                return "Enter Valied Email";
                              }
                            },
                          ),
                        ),

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

                        //======================================================================================================================================

                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 20).r,
                          child: Text(
                            'Confirm Password',
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
                            controller: confirmpass,
                            obscureText: true,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText: 'Confirm Password',
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
                                return "Enter Password";
                              } else if (confirmpass.text != password.text) {
                                return "Passwords do not match";
                              }
                            },
                          ),
                        ),

                        //======================================================================================================================================

                        SizedBox(
                          height: 30,
                        ),

                        Align(
                          alignment: Alignment.center,
                          child: InkWell(
                            onTap: () async {
                              if (_formfield.currentState!.validate()) {
                                setData();
                                await register();
                                print("Faild");
                              }
                            },
                            child: Container(
                              height: 40.h,
                              width: 200.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8).r,
                                  color: Colors.indigo.shade900),
                              child: Center(
                                child: Text(
                                  'SIGN UP',
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
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account ?",
                              style: GoogleFonts.poppins(fontSize: 15),
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Login",
                                  style: GoogleFonts.poppins(
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
