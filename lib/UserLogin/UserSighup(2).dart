import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class UserSignup extends StatefulWidget {

 const  UserSignup({super.key,});

  @override
  State<UserSignup> createState() => _UserSignupState();
}

// Future<dynamic> getid() async {
//   var Getdata = FirebaseFirestore.instance.collection("UserSignup").get();
// }

class _UserSignupState extends State<UserSignup> {
  Future<dynamic> register() async {
    await FirebaseFirestore.instance.collection('UserSignup').doc().update({
      "Name": name.text,
      "Email": email.text,
      "Profilestatus": 2.bitLength,
      "Password": password.text,
      "Status": 0
    });
    print("Register sucsess");
  }

  final _formfield = GlobalKey<FormState>();

  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmpass = TextEditingController();

  TextEditingController _date = TextEditingController();

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
                            controller: email,
                            obscureText: true,
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
                            onTap: () {
                              if (_formfield.currentState!.validate()) {
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
