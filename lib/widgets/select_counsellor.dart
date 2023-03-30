// ignore_for_file: prefer_const_constructors

import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class select_counsellor extends StatefulWidget {
  final String name;
  // final ValueChanged<bool> isSelected;
  const select_counsellor({super.key, required this.name});

  @override
  State<select_counsellor> createState() => _select_counsellorState();
}

class _select_counsellorState extends State<select_counsellor> {
  bool is_selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          is_selected = !is_selected;
          // widget.isSelected(is_selected);
        });
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
              width: 2,
              color:
                  is_selected == true ? Color(0xFFFBA3FF) : Color(0xFFD3F36B)),
          borderRadius: BorderRadius.circular(16.0),
          color: Color(0xFFD3F36B),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Color(0xffE6E6E6),
                radius: 24,
                child: Icon(
                  Icons.person,
                  color: Color(0xffCCCCCC),
                ),
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Senior Counsellor",
                    style: TextStyle(
                      color: Color(0xFF5E6272),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
              // SizedBox(width: 70),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Visibility(
                  visible: is_selected == true,
                  child: Icon(
                    Icons.verified_rounded,
                    color: Colors.green,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
