import 'package:edulive/profile/Profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    Center(child: Text("Add Notification page")),
    Profilepage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              backgroundColor: Colors.indigo.shade900,
              icon: Icon(Icons.home),
              label: 'Home'),
          BottomNavigationBarItem(
              backgroundColor: Colors.indigo.shade900,
              icon: Icon(Icons.search),
              label: 'Search'),
          BottomNavigationBarItem(
              backgroundColor: Colors.indigo.shade900,
              icon: Icon(Icons.forward_to_inbox),
              label: "inbox"),
          BottomNavigationBarItem(
              backgroundColor: Colors.indigo.shade900,
              icon: Icon(Icons.person),
              label: 'Profile'),
        ],
      ),
      body: _pages[_selectedIndex],
    );
  }
}
