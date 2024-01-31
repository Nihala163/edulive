import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class AddVideo extends StatefulWidget {
  AddVideo({super.key});

  @override
  State<AddVideo> createState() => _AddVideoState();
}

class _AddVideoState extends State<AddVideo> {
  String selectedValue = 'Mechanic';
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Mechanic"), value: "Mechanic"),
      DropdownMenuItem(child: Text("Electric"), value: "Electric"),
      DropdownMenuItem(child: Text("AutoMobile"), value: "AutoMobile"),
    ];
    return menuItems;
  }

  final TextEditingController url = TextEditingController();
  var Course;

  Future<void> uploadurl(String link) async {
    if (link.isNotEmpty) {
      await FirebaseFirestore.instance.collection('FirstyearVediourl').add({
        'url': link,
        'course': Course,
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('YouTube link added successfully'),
        ),
      );
      url.clear();
    } else {
      // Show an error message if the link is empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter a valid YouTube link'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text(
              'First Years',
            )),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20).r,
          child: Column(
            children: [
              Spacer(),
              customtextfield(controller: url, hintText: 'Url'),
              SizedBox(
                height: 50.h,
              ),
              DropdownButton(
                isExpanded: true,
                value: selectedValue,
                items: dropdownItems,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValue = newValue!;
                  });
                  Course = selectedValue;
                },
              ),
              Spacer(),
              CustomElevatedbutton(
                  child: Text('post video'),
                  onPressed: () {
                    String? vedioId = YoutubePlayer.convertUrlToId(url.text);
                    uploadurl(vedioId!);
                    print(vedioId);
                  },
                  minimumSize:
                  MaterialStatePropertyAll(Size(double.infinity, 50.h))),
              SizedBox(
                height: 20.h,
              )
            ],
          ),
        ));
  }

  ElevatedButton CustomElevatedbutton(
      {required void Function()? onPressed,
        required Widget? child,
        MaterialStateProperty<Size?>? minimumSize}) {
    return ElevatedButton(
        onPressed: onPressed,
        child: child,
        style: ButtonStyle(
            padding: MaterialStatePropertyAll(EdgeInsets.all(10).w),
            minimumSize: minimumSize,
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6).w))));
  }

  TextField customtextfield({
    void Function(String)? onChanged,
    TextEditingController? controller,
    String? hintText,
  }) =>
      TextField(
        onChanged: onChanged,
        controller: controller,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10).w,
            isDense: true,
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(6.w)),
            hintText: hintText),
      );
}
