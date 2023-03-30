import 'package:career_counselling/screens/Counselling-tab/search-counsellors.dart';
import 'package:flutter/material.dart';
import 'package:career_counselling/screens/Get-Started/getStarted_interest.dart'
    as getStarted_interest;

class interestSelect extends StatefulWidget {
  final String interest;
  int x;

  interestSelect({super.key, required this.interest, required this.x});

  @override
  State<interestSelect> createState() => _interestSelectState();
}

class _interestSelectState extends State<interestSelect> {
  int currentcolor = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: currentcolor == 1 ? Color(0xFF1AE02E) : Colors.black,
      borderRadius: BorderRadius.circular(15.68),
      child: DecoratedBox(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.red),
            borderRadius: BorderRadius.circular(15.68)),
        child: InkWell(
          // borderRadius: BorderRadius.circular(15.68),
          onTap: (() => setState(() {
                if (currentcolor == 0) {
                  currentcolor = 1;
                  widget.x += 1;
                } else {
                  currentcolor = 0;
                  widget.x -= 1;
                }
                print(widget.x);
              })),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
            child: Text(
              widget.interest,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
