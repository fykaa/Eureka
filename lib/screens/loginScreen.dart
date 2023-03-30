// ignore_for_file: prefer_const_constructors

import 'package:career_counselling/screens/loginScreenPassword.dart';
import 'package:career_counselling/screens/signupScreen.dart';
import 'package:flutter/material.dart';
import 'loginScreenPassword.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  var _loginemailcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        // appBar: AppBar(
        //   elevation: 0,
        //   leading: Icon(Icons.arrow_back),
        // ),
        body: Center(
            child: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFFE0F4A2), Color(0xFFD3F36B), Color(0xFFE0F4A2)],
      )),
      // ignore: prefer_const_literals_to_create_immutables
      child: Stack(children: <Widget>[
        Positioned(
          top: 44,
          left: 40,
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
        Positioned(
          top: 124,
          left: 40,
          child: Text(
            "What's your \nemail \naddress?",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              height: 1.25,
            ),
          ),
        ),
        Positioned(
          top: 268,
          left: 40,
          child: Text(
            "YOUR EMAIL",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 10,
              color: Color(0xFF3A3D46),
            ),
          ),
        ),
        Positioned(
          top: 292,
          left: 40,
          height: 48,
          child: SizedBox(
            width: 325,
            child: TextField(
              maxLines: 1,
              controller: _loginemailcontroller,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFD3F36B),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFA5F59C)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFA5F59C)),
                  ),
                  hintText: "hello@careercounsellor.com",
                  suffixIcon: IconButton(
                    onPressed: _loginemailcontroller.clear,
                    icon: Icon(Icons.close),
                  )),
            ),
          ),
        ),
        Positioned(
          top: 372,
          left: 40,
          child: SizedBox(
            width: 325,
            height: 48,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => loginScreenPassword(
                          loginemail: _loginemailcontroller.text)),
                );
              },
              child: Text(
                "Continue with email",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0),
              ))),
            ),
          ),
        ),
        Positioned(
            top: 420,
            left: 105,
            child: Row(
              children: [
                Text("New to [appname]?"),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const signupScreen()),
                      );
                    },
                    child: Text(
                      "Sign up",
                      style: TextStyle(color: Colors.blueAccent),
                    ))
              ],
            ))
      ]),
    )));
  }
}
