import 'dart:ui';

import 'package:career_counselling/screens/Get-Started/getStarted_interest.dart';
import 'package:flutter/material.dart';

class classSelect extends StatefulWidget {
  final Color boxcolor;
  final String bottomString;

  const classSelect({
    super.key,
    required this.boxcolor,
    required this.bottomString,
  });

  @override
  State<classSelect> createState() => _classSelectState();
}

class _classSelectState extends State<classSelect> {
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(12),
      child: Ink(
        height: 140,
        width: 140,
        // color: widget.boxcolor,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: widget.boxcolor.withOpacity(0.7),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const getStarted_interest()),
            );
          },
          // customBorder: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(12),
          // ),
          child: DefaultTextStyle(
            style: const TextStyle(
              // fontFamily: 'Poppins',
              fontSize: 32,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 21, top: 20),
              child: Text(
                widget.bottomString,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
