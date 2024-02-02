import 'package:edulive/Notification/Notification%20User.dart';
import 'package:edulive/profile/Profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../todo/todo.dart';
import 'home page.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    Center(child: Text("Add Search page")),
    AddTodo(),
    Profilepage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        iconSize: 30,
        fixedColor: Colors.indigo.shade900,
        elevation: 100,
        mouseCursor: MaterialStateMouseCursor.textable,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, color: Colors.black),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              label: 'Search'),
          BottomNavigationBarItem(
              icon: InkWell(
                  onTap: () {},
                  child: Icon(
                    CupertinoIcons.check_mark_circled,
                    color: Colors.black,
                  )),
              label: "Todo"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined, color: Colors.black),
              label: 'Profile'),
        ],
      ),
      body: _pages[_selectedIndex],
    );
  }
}
