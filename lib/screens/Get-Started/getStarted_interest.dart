// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:career_counselling/screens/Counselling-tab/search-counsellors.dart';
import 'package:career_counselling/screens/HomeScreen/homeBottomBar.dart';
import 'package:career_counselling/screens/HomeScreen/homeScreen.dart';
import 'package:career_counselling/widgets/interestSelect.dart';
import 'package:flutter/material.dart';

int chosen_interests = 0;

class getStarted_interest extends StatefulWidget {
  const getStarted_interest({super.key});

  @override
  State<getStarted_interest> createState() => _getStarted_interestState();
}

class _getStarted_interestState extends State<getStarted_interest> {
  int selected_interests = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFFE0F4A2), Color(0xFFD3F36B), Color(0xFFE0F4A2)],
      )),
      child: Stack(children: [
        // Container(
        //   height: 800,
        // ),
        Positioned(
          top: 47,
          left: 35,
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
          ),
        ),
        Positioned(
          top: 62,
          left: 85,
          child: Row(children: [
            Container(
              height: 15,
              width: 115,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17), color: Colors.black),
            ),
            SizedBox(width: 8),
            Container(
              height: 15,
              width: 115,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17), color: Colors.black),
            )
          ]),
        ),
        Positioned(
          top: 105,
          left: 70,
          child: Text(
            "Getting Started",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 32,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Positioned(
          top: 196,
          left: 48,
          child: Text(
            "What Interests \nyou \nthe most?",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 32,
              fontWeight: FontWeight.w500,
              height: 1.25,
            ),
          ),
        ),
        Positioned(
          top: 349,
          left: 48,
          child: Text(
            "Choose 3 interests: ",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 20,
              fontWeight: FontWeight.w500,
              height: 1.25,
            ),
          ),
        ),
        Positioned(
          top: 400,
          left: 50,
          child: SizedBox(
            width: 350,
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                interestSelect(interest: 'Technology', x: selected_interests),
                interestSelect(interest: 'Finance', x: selected_interests),
                interestSelect(
                    interest: 'Social Science', x: selected_interests),
                interestSelect(
                    interest: 'Politics and Design', x: selected_interests),
                interestSelect(interest: 'Law', x: selected_interests),
                interestSelect(
                    interest: 'Medical Science', x: selected_interests),
                interestSelect(interest: 'Law', x: selected_interests),
                interestSelect(
                    interest: 'Social Science', x: selected_interests),
                interestSelect(interest: 'Finance', x: selected_interests),
                Padding(
                  padding: EdgeInsets.only(top: 40, left: 20, right: 43),
                  child: SizedBox(
                    height: 48,
                    width: 293,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeBottomBar()),
                        );
                      },
                      child: Text(
                        "Confirm your Interests",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xFF0E3A25)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0),
                          ))),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    )));
  }
}
