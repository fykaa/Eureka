// ignore_for_file: prefer_const_constructors

import 'package:career_counselling/screens/Get-Started/getStarted_class.dart';
import 'package:career_counselling/screens/HomeScreen/homeBottomBar.dart';
import 'package:career_counselling/screens/HomeScreen/homeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class loginScreenPassword extends StatefulWidget {
  final String loginemail;

  const loginScreenPassword({super.key, required this.loginemail});

  @override
  State<loginScreenPassword> createState() => _loginScreenPasswordState();
}

class _loginScreenPasswordState extends State<loginScreenPassword> {
  var _loginpasswordController = TextEditingController();

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
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
          ),
        ),
        Positioned(
          top: 124,
          left: 40,
          child: Text(
            "Login",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
          ),
        ),
        Positioned(
          top: 175,
          left: 40,
          child: Text(
            "Using hello@xyz.com to login",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 13,
            ),
          ),
        ),
        // ignore: prefer_const_constructors
        Positioned(
          top: 236,
          left: 40,
          child: Text(
            "YOUR PASSWORD",
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Color(0xFF3A3D46),
            ),
          ),
        ),
        Positioned(
          top: 260,
          left: 40,
          height: 48,
          child: SizedBox(
            width: 325,
            child: TextField(
              maxLines: 1,
              obscureText: true,
              controller: _loginpasswordController,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFD3F36B),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFA5F59C)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFA5F59C)),
                  ),
                  hintText: "Enter password",
                  suffixIcon: Icon(Icons.close)),
            ),
          ),
        ),
        Positioned(
          top: 332,
          left: 40,
          child: SizedBox(
            width: 325,
            height: 48,
            child: ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                        email: widget.loginemail,
                        password: _loginpasswordController.text)
                    .then((value) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeBottomBar()),
                  );
                }).onError((error, stackTrace) => null);
              },
              child: Text(
                "Sign In",
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
      ]),
    )));
  }
}
