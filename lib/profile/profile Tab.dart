import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20.h, left: 20,),
            child: Row(
              children: [
                Text("Username",
                    style:
                        GoogleFonts.poppins(fontSize: 15, color: Colors.grey)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(
              children: [
                Text("Name:",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.black)),
              ],
            ),
          ),
          //
          Padding(
            padding: EdgeInsets.only(top: 20.h, left: 20),
            child: Row(
              children: [
                Text("Gender",
                    style:
                        GoogleFonts.poppins(fontSize: 15, color: Colors.grey)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(
              children: [
                Text("Male",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.black)),
              ],
            ),
          ),
          //
          Padding(
            padding: EdgeInsets.only(top: 20.h, left: 20),
            child: Row(
              children: [
                Text("Date of birth",
                    style:
                        GoogleFonts.poppins(fontSize: 15, color: Colors.grey)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(
              children: [
                Text("04/07/2003",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.black)),
              ],
            ),
          ),
          //
          Padding(
            padding: EdgeInsets.only(top: 20.h, left: 20),
            child: Row(
              children: [
                Text("Email",
                    style:
                        GoogleFonts.poppins(fontSize: 15, color: Colors.grey)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(
              children: [
                Text("Name@gmail.com",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.black)),
              ],
            ),
          ),
          //
          Padding(
            padding: EdgeInsets.only(top: 20.h, left: 20),
            child: Row(
              children: [
                Text("Mobile Number",
                    style:
                        GoogleFonts.poppins(fontSize: 15, color: Colors.grey)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(
              children: [
                Text("+91 948558839",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.black)),
              ],
            ),
          ),
          //
          Padding(
            padding: EdgeInsets.only(top: 20.h, left: 20),
            child: Row(
              children: [
                Text("Education ",
                    style:
                        GoogleFonts.poppins(fontSize: 15, color: Colors.grey)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(
              children: [
                Text("BBA calicut univercity",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.black)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
