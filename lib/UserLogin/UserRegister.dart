import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Userregister extends StatefulWidget {
  const Userregister({super.key});

  @override
  State<Userregister> createState() => _UserregisterState();
}

class _UserregisterState extends State<Userregister> {
  // Future<dynamic> sign() async{
  //   await FirebaseFirestore.instance.collection('User signup').add({
  //     "Name":name.text,
  //     "Email":email.text,
  //     "Phone number":phonenumber.text,
  //     "Date of birth":_date.text,
  //     "Address":address.text,
  //     "College":collegeItems
  //
  //
  //   });
  // }

  //=======================================================================================================

  final _formfield = GlobalKey<FormState>();

  final name = TextEditingController();
  final email = TextEditingController();
  final phonenumber = TextEditingController();
  final password = TextEditingController();
  final confirmpass = TextEditingController();
  final address = TextEditingController();
  TextEditingController _date = TextEditingController();

  bool passToggle = true;

  var selectedGender;

  final List<String> collegeItems = [
    'KMO College',
    'KMO ITI',
  ];

  final List<String> departmentitem = [
    'B.A/.L.L.B. (Law)',
    'BBA',
    'BCA',
    'Bcom',
    'Bachelor of Architecture',
  ];

  final List<String> yearlist = [
    '1 year',
    '2 year',
    '3 year',
  ];

  String? selectedValue;

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
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                titlePadding: EdgeInsets.only(left: 0).r,
                title: Text(
                  'REGISTER',
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

                        //============================================================================================================================

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
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 15).r,
                          child: Text(
                            'Gender',
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: 17.sp,
                                color: Colors.black),
                          ),
                        ),

                        RadioListTile(
                          title: Text('Male'),
                          value: 'male',
                          groupValue: selectedGender,
                          onChanged: (value) {
                            setState(() {
                              selectedGender = value!;
                            });
                          },
                        ),
                        RadioListTile(
                          title: Text('Female'),
                          value: 'female',
                          groupValue: selectedGender,
                          onChanged: (value) {
                            setState(() {
                              selectedGender = value!;
                            });
                          },
                        ),
                        RadioListTile(
                            title: Text('Other'),
                            value: 'other',
                            groupValue: selectedGender,
                            onChanged: (value) {
                              setState(() {
                                selectedGender = value!;
                              });
                            }),

                        //=======================================================================================================================================================

                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 15).r,
                          child: Text(
                            'Date of birth',
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
                            enabled: true,
                            controller: _date,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText: 'Select date',
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
                            onTap: () async {
                              DateTime? pickeddate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2101));

                              if (pickeddate != null) {
                                setState(() {
                                  _date.text = DateFormat('yyyy-MM-dd')
                                      .format(pickeddate);
                                });
                              }
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Date of birth";
                              }
                            },
                          ),
                        ),
                        //=======================================================================================================================================================

                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 15).r,
                          child: Text(
                            'Address',
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
                            controller: address,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText: 'Enter Address',
                                hintStyle: GoogleFonts.poppins(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff878787)),
                                contentPadding: EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 15)
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
                                return "Enter Address";
                              }
                            },
                          ),
                        ),

                        //=======================================================================================================================================================

                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 15).r,
                          child: Text(
                            'College',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              fontSize: 17.sp,
                              color: Colors.black,
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, top: 5),
                          child: SizedBox(
                            height: 50,
                            child: DropdownButtonFormField2<String>(
                              isExpanded: true,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,

                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(8).r,
                                ),
                                // Add more decoration..
                              ),
                              hint: const Text(
                                'Select Your College',
                                style: TextStyle(fontSize: 14),
                              ),
                              items: collegeItems
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (value) {},
                              onSaved: (value) {
                                selectedValue = value.toString();
                              },
                              buttonStyleData: const ButtonStyleData(
                                padding: EdgeInsets.only(right: 8),
                              ),
                              iconStyleData: const IconStyleData(
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.black45,
                                ),
                                iconSize: 24,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please select an College';
                                }
                                return null;
                              },
                              dropdownStyleData: DropdownStyleData(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.r),
                                ),
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                              ),
                            ),
                          ),
                        ),

                        //======================================================================================================================================

                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 15).r,
                          child: Text(
                            'Department',
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: 17.sp,
                                color: Colors.black),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, top: 5),
                          child: SizedBox(
                            height: 50,
                            child: DropdownButtonFormField2<String>(
                              isExpanded: true,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(8).r,
                                ),
                                // Add more decoration..
                              ),
                              hint: const Text(
                                'Select Your department',
                                style: TextStyle(fontSize: 14),
                              ),
                              items: departmentitem
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (value) {},
                              onSaved: (value) {
                                selectedValue = value.toString();
                              },
                              buttonStyleData: const ButtonStyleData(
                                padding: EdgeInsets.only(right: 8),
                              ),
                              iconStyleData: const IconStyleData(
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.black45,
                                ),
                                iconSize: 24,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please select an Department';
                                }
                                return null;
                              },
                              dropdownStyleData: DropdownStyleData(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.r),
                                ),
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                              ),
                            ),
                          ),
                        ),

                        //======================================================================================================================================

                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 15).r,
                          child: Text(
                            'Year',
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: 17.sp,
                                color: Colors.black),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, top: 5),
                          child: SizedBox(
                            height: 50,
                            child: DropdownButtonFormField2<String>(
                              isExpanded: true,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xff878787)),
                                  borderRadius: BorderRadius.circular(8).r,
                                ),
                                // Add more decoration..
                              ),
                              hint: const Text(
                                'Select Year',
                                style: TextStyle(fontSize: 14),
                              ),
                              items: yearlist
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (value) {},
                              onSaved: (value) {
                                selectedValue = value.toString();
                              },
                              buttonStyleData: const ButtonStyleData(
                                padding: EdgeInsets.only(right: 8),
                              ),
                              iconStyleData: const IconStyleData(
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.black45,
                                ),
                                iconSize: 24,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please select an Year';
                                }
                                return null;
                              },
                              dropdownStyleData: DropdownStyleData(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.r),
                                ),
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                              ),
                            ),
                          ),
                        ),

                        //======================================================================================================================================

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
                                // Navigator.push(context, MaterialPageRoute(
                                //   builder: (context) {
                                //     return Allcourses();
                                //   },
                                // ));
                                name.clear();
                                password.clear();
                              }

                              if (selectedGender == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Select Gender'),
                                  ),
                                );
                              } else {
                                print("select gender");
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
                                  'REGISTER',
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
                          height: 100,
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
