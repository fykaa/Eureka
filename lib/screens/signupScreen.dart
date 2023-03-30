// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Get-Started/getStarted_class.dart';

const List<String> list = <String>['8', '9', '10', '11', '12'];

class signupScreen extends StatefulWidget {
  const signupScreen({super.key});

  @override
  State<signupScreen> createState() => _signupScreenState();
}

class _signupScreenState extends State<signupScreen> {
  String dropdownValue = list.first;

  var _signupemailController = TextEditingController();
  var _signuppasswordController = TextEditingController();

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
            "Sign Up",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
          ),
        ),

        // ignore: prefer_const_constructors
        Positioned(
          top: 236,
          left: 40,
          child: Text(
            "YOUR EMAIL",
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
              controller: _signupemailController,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFD3F36B),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFA5F59C)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFA5F59C)),
                  ),
                  hintText: "Your Email",
                  suffixIcon: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: _signupemailController.clear,
                  )),
            ),
          ),
        ),
        Positioned(
          top: 331,
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
          top: 355,
          left: 40,
          height: 48,
          child: SizedBox(
            width: 325,
            child: TextField(
              maxLines: 1,
              controller: _signuppasswordController,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFD3F36B),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFA5F59C)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFA5F59C)),
                  ),
                  hintText: "Password",
                  suffixIcon: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: _signuppasswordController.clear,
                  )),
            ),
          ),
        ),

        Positioned(
          top: 428,
          left: 40,
          child: SizedBox(
            width: 325,
            height: 48,
            child: ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                        email: _signupemailController.text,
                        password: _signuppasswordController.text)
                    .then((value) {
                  print(_signupemailController);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const getStarted_class()),
                  );
                }).onError((error, stackTrace) => null);
              },
              child: Text(
                "Sign Up",
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
