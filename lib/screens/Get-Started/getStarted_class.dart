// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:career_counselling/widgets/classSelect.dart';

class getStarted_class extends StatefulWidget {
  const getStarted_class({super.key});

  @override
  State<getStarted_class> createState() => _getStarted_classState();
}

class _getStarted_classState extends State<getStarted_class> {
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
      child: SingleChildScrollView(
        child: Stack(children: [
          Container(
            height: 800,
          ),
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
                    borderRadius: BorderRadius.circular(17),
                    color: Colors.black),
              ),
              SizedBox(width: 8),
              Container(
                height: 15,
                width: 115,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    color: Colors.white),
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
              "What grade are \nyou in?",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 32,
                fontWeight: FontWeight.w500,
                height: 1.25,
              ),
            ),
          ),
          Positioned(
            top: 305,
            left: 40,
            child: classSelect(
                boxcolor: Color(0xFFAED530), bottomString: "8\u1d57\u02b0"),
          ),
          Positioned(
            top: 305,
            left: 215,
            child: classSelect(
              boxcolor: Color(0xFF1CB9C3),
              bottomString: "9\u1d57\u02b0",
            ),
          ),
          Positioned(
            top: 468,
            left: 40,
            child: classSelect(
                boxcolor: Color(0xFF4EB210), bottomString: '10\u1d57\u02b0'),
          ),
          Positioned(
            top: 468,
            left: 215,
            child: classSelect(
              boxcolor: Color(0xFFE83030),
              bottomString: '11\u1d57\u02b0',
            ),
          ),
          Positioned(
            top: 631,
            left: 40,
            child: classSelect(
              boxcolor: Color(0xFFCE7D1D),
              bottomString: '12\u1d57\u02b0',
            ),
          )
        ]),
      ),
    )));
  }
}
