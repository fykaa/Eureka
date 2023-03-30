import 'package:career_counselling/screens/Counselling-tab/search-counsellors.dart';
import 'package:career_counselling/screens/HomeScreen/homeScreen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:career_counselling/screens/Profile-tab/profile-screen.dart';

class HomeBottomBar extends StatefulWidget {
  @override
  _HomeBottomBarState createState() => _HomeBottomBarState();
}

class _HomeBottomBarState extends State<HomeBottomBar> {
  int index = 0;
  final screens = [
    homeScreen(),
    search_counsellors(),
    // CountdownPage(),
    ProfileScreen(),
  ];

  final items = const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
        icon: Icon(Icons.home), label: 'home', backgroundColor: Colors.green),
    BottomNavigationBarItem(
        icon: Icon(Icons.person_add_sharp),
        label: 'Counselling',
        backgroundColor: Colors.yellow),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Profile',
      backgroundColor: Colors.blue,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: screens[index],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xFFDEF29E),
          items: items,
          currentIndex: index,
          onTap: (index) {
            setState(() {
              this.index = index;
            });
          },
        ),
      ),
    );
  }
}
