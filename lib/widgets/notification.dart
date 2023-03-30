// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class notification extends StatefulWidget {
  final String name;

  const notification({super.key, required this.name});

  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 0, right: 0),
      child: Container(
        child: Column(children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: CircleAvatar(
                  backgroundColor: Color(0xffE6E6E6),
                  radius: 24,
                  child: Icon(
                    Icons.person,
                    color: Color(0xffCCCCCC),
                  ),
                ),
              ),

              SizedBox(width: 22.17),
              // ignore: prefer_const_literals_to_create_immutables

              Text(
                widget.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(width: 80),
              Text(
                "Nov 2nd",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 71),
            child: Text(
              "Hi, this is Ankit. Feel free to reach out to me for counselling.",
              style: TextStyle(
                color: Color(0xFF5E6272),
                fontSize: 13,
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "Request a callback",
                style: TextStyle(
                  color: Color(0xFF5E6272),
                  fontSize: 12,
                ),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFFD3F373)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                          side: BorderSide(color: Color(0xFF5E6272))))),
            ),
            SizedBox(width: 14),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "Message",
                style: TextStyle(
                  color: Color(0xFF5E6272),
                  fontSize: 12,
                ),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFFD3F373)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                          side: BorderSide(color: Color(0xFF5E6272))))),
            ),
          ])
        ]),
      ),
    );
  }
}
