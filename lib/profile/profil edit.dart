import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class Editprofiles extends StatefulWidget {
  const Editprofiles({super.key});

  @override
  State<Editprofiles> createState() => _EditprofilesState();
}

class _EditprofilesState extends State<Editprofiles> {
  XFile? _image;

  var imageURL;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo.shade900,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        title: Text(" Edit Profile",
            style: GoogleFonts.poppins(fontSize: 20, color: Colors.white)),
      ),
      body: Stack(children: [
        Container(
          color: Colors.indigo.shade900,
        ),
        Padding(
          padding: EdgeInsets.only(top: 250.h),
          child: Container(
            height: 600.h,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
                color: Colors.white),
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20.h, left: 20),
                  child: Row(
                    children: [
                      Text("Username",
                          style: GoogleFonts.poppins(
                              fontSize: 15, color: Colors.grey)),
                    ],
                  ),
                ),
                SizedBox(
                  width: 200.w,
                  height: 50.h,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r)))),
                  ),
                ),

                //
                Padding(
                  padding: EdgeInsets.only(top: 20.h, left: 20),
                  child: Row(
                    children: [
                      Text("Gender",
                          style: GoogleFonts.poppins(
                              fontSize: 15, color: Colors.grey)),
                    ],
                  ),
                ),
                SizedBox(
                  width: 200.w,
                  height: 50.h,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r)))),
                  ),
                ),
                //
                Padding(
                  padding: EdgeInsets.only(top: 20.h, left: 20),
                  child: Row(
                    children: [
                      Text("Date of birth",
                          style: GoogleFonts.poppins(
                              fontSize: 15, color: Colors.grey)),
                    ],
                  ),
                ),
                SizedBox(
                  width: 200.w,
                  height: 50.h,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r)))),
                  ),
                ),
                //
                Padding(
                  padding: EdgeInsets.only(top: 20.h, left: 20),
                  child: Row(
                    children: [
                      Text("Email",
                          style: GoogleFonts.poppins(
                              fontSize: 15, color: Colors.grey)),
                    ],
                  ),
                ),
                SizedBox(
                  width: 200.w,
                  height: 50.h,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r)))),
                  ),
                ),
                //
                Padding(
                  padding: EdgeInsets.only(top: 20.h, left: 20),
                  child: Row(
                    children: [
                      Text("Mobile Number",
                          style: GoogleFonts.poppins(
                              fontSize: 15, color: Colors.grey)),
                    ],
                  ),
                ),
                SizedBox(
                  width: 200.w,
                  height: 50.h,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r)))),
                  ),
                ),
                //
                Padding(
                  padding: EdgeInsets.only(top: 20.h, left: 20),
                  child: Row(
                    children: [
                      Text("Education ",
                          style: GoogleFonts.poppins(
                              fontSize: 15, color: Colors.grey)),
                    ],
                  ),
                ),
                SizedBox(
                  width: 200.w,
                  height: 50.h,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r)))),
                  ),
                ),

                //   Buttton

                Padding(
                  padding: const EdgeInsets.all(30),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(
                        Colors.indigo.shade900,
                      )),
                      onPressed: () {},
                      child: Text(
                        "Save changes",
                        style: TextStyle(color: Colors.white),
                      )),
                )
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50.h),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                    "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg"),
                radius: 50.r,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: EdgeInsets.only(top: 130.h, left: 60),
                child: CircleAvatar(
                  backgroundColor: Colors.black87,
                  child: IconButton(
                      onPressed: () {
                        pickimage();
                      },
                      icon: Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                      )),
                )),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: EdgeInsets.only(top: 180.h),
                child: Text(
                  "Name",
                  style:
                      GoogleFonts.poppins(color: Colors.white, fontSize: 15.sp),
                )),
          ],
        )
      ]),
    );
  }

  Future<void> uploadimage() async {
    //   add firebase
  }

  Future<void> pickimage() async {
    final ImagePicker _picker = ImagePicker();
    try {
      XFile? pickedimage = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedimage != null) {
        setState(() {
          _image = pickedimage;
        });
        print("Image upload succersfully");
        await uploadimage();
      }
    } catch (e) {
      print("Error picking image:$e");
    }
  }
}
//
//
//
//
