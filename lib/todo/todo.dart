import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

const whiteone = Color(0xfff5f6f9);
const customBalck = Color(0xff000000);
const white = Color(0xffFFFFFF);

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

final todotitle = TextEditingController();
var dateController = TextEditingController();
DateTime? selectdate;

class _AddTodoState extends State<AddTodo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteone,
      appBar: AppBar(
        backgroundColor: white,
        title: AppText(
            text: "My Todo",
            weight: FontWeight.w400,
            size: 25,
            textcolor: customBalck),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            TextFormField(
              controller: todotitle,
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
                  hintText: "Search ",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade500))),
            ),
            SizedBox(
              height: 30,
            ),
            const Align(
                alignment: Alignment.bottomLeft,
                child: AppText(
                    text: "All Todos",
                    weight: FontWeight.w600,
                    size: 25,
                    textcolor: customBalck)),
            const SizedBox(
              height: 20,
            ),
            StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection('Todo').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Text("Error ${snapshot.error}");
                  }
                  final Data = snapshot.data?.docs ?? [];
                  return Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 10).r,
                          child: ListTile(
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            title: Text(
                              Data[index]['Title'],
                            ),
                            subtitle: Text(Data[index]['Date']),
                            tileColor: Colors.grey.shade300,
                            trailing: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r),color: Colors.greenAccent,),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                    onTap: () {
                                      Data[index].reference.delete();
                                    },
                                    child: const Icon(
                                      Icons.delete,
                                      color: whiteone,
                                    )),
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: Data.length,
                    ),
                  );
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showMyDialog();
        },
        backgroundColor: white,
        child: const Icon(Icons.add),
      ),
    );
  }

  pickDate(BuildContext context) async {
    var date = await showDatePicker(
        context: context,
        firstDate: DateTime(2000 - 01 - 01),
        lastDate: DateTime(2300 - 01 - 01));
    if (date != null) {
      setState(() {
        selectdate = date;
      });
      dateController.text =
          DateFormat('dd/MM/yy').format(selectdate!).toString();
    }
  }

  addTodo() async {
    await FirebaseFirestore.instance.collection('Todo').add({
      'User_id': "12345",
      'Title': todotitle.text,
      'Date': dateController.text
    });

    todotitle.clear();
    dateController.clear();
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: white,
          title: const Text('Add Todo'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextFormField(
                  controller: todotitle,
                  decoration: const InputDecoration(
                      hintText: "Enter Title", border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 10.h,
                ),
                TextFormField(
                  readOnly: true,
                  controller: dateController,
                  decoration: InputDecoration(
                      hintText: "Select Date",
                      suffixIcon: InkWell(
                          onTap: () {
                            pickDate(context);
                          },
                          child: const Icon(Icons.date_range)),
                      border: const OutlineInputBorder()),
                ),
                SizedBox(
                  width: 20.w,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            MyButton(
                btnname: "Save",
                btncolor: customBalck,
                click: () {
                  addTodo();
                },
                bordercolor: customBalck,
                txtcolor: white),
            SizedBox(
              height: 10.h,
            ),
            MyButton(
                btnname: "Cancel",
                btncolor: customBalck,
                click: () {
                  Navigator.pop(context);
                },
                bordercolor: customBalck,
                txtcolor: white)
          ],
        );
      },
    );
  }
}

class AppText extends StatelessWidget {
  const AppText(
      //Custom Text Widget.....
      {super.key,
      required this.text,
      required this.weight,
      required this.size,
      required this.textcolor});

  final String text;
  final FontWeight weight;
  final double size;
  final Color textcolor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
          fontSize: size.sp, color: textcolor, fontWeight: weight),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton(
      {super.key,
      required this.btnname,
      required this.btncolor,
      required this.click,
      required this.bordercolor,
      required this.txtcolor});

  final String btnname;
  final Color btncolor;
  final Color txtcolor;
  final Color bordercolor;
  final void Function() click;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: click,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(color: bordercolor),
            borderRadius: BorderRadius.circular(8).r,
            color: btncolor),
        child: Center(
          child: AppText(
              text: btnname,
              weight: FontWeight.w400,
              size: 15,
              textcolor: txtcolor),
        ),
      ),
    );
  }
}
