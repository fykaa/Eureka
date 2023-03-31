// ignore_for_file: prefer_const_constructors

import 'package:career_counselling/screens/Counselling-tab/counsellors-notif.dart';
import 'package:career_counselling/screens/Questionnaire-screen/questionnaire.dart';
import 'package:career_counselling/widgets/events.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFE0F4A2), Color(0xFFD3F36B), Color(0xFFE0F4A2)],
        )),
        child: Padding(
          padding: EdgeInsets.only(top: 30, right: 0),
          child: SingleChildScrollView(
            child: Column(children: [
              ListTile(
                horizontalTitleGap: 1,
                leading: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("assets/images/student.jpg"),
                ),
                title: Text(
                  'Hey User!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Text(
                  'Start your Journey!',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Row(children: [
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 40),
                  child: SizedBox(
                    width: 278,
                    height: 42,
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        fillColor: Color(0xFF181A20),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none),
                        hintText: 'Search',
                        contentPadding: EdgeInsets.only(top: 9, left: 16),
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                        suffixIcon: Icon(Icons.search, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 21),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: IconButton(
                    icon: Icon(Icons.notifications_outlined, size: 28),
                    color: Colors.black,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const counsellors_notif()));
                    },
                  ),
                ),
              ]),
              Divider(
                color: Color(0xFFBBE532),
                height: 17,
                thickness: 2,
              ),
              SizedBox(height: 25.5),
              Padding(
                padding: EdgeInsets.only(right: 255),
                child: Text(
                  "Take a quiz",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.only(left: 0),
                child: Container(
                  width: 327,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xFFAED530),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 11),
                      Padding(
                        padding: EdgeInsets.only(left: 19, right: 140),
                        child: Text(
                          "Answer some questions",
                          style: TextStyle(
                              color: Color(0xFF434343),
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 19, right: 120),
                        child: Text(
                          "10 questions | 45+ attended",
                          style: TextStyle(
                              color: Color(0xFF434343),
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(height: 7),
                      Padding(
                        padding: EdgeInsets.only(left: 30, bottom: 5, top: 7),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 115,
                              height: 25,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const questionnaire()));
                                },
                                child: Text(
                                  "Take the quiz",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 8,
                                  ),
                                ),
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Color(0xFF86FFCA)),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24.0),
                                    ))),
                              ),
                            ),
                            SizedBox(width: 30),
                            SizedBox(
                              width: 115,
                              height: 25,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  "Remind me Later",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 8,
                                  ),
                                ),
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Color(0xFF86FFCA)),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24.0),
                                    ))),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 29),
              Padding(
                padding: EdgeInsets.only(right: 220),
                child: Text(
                  "Events near you",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 18),
              StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection("events").snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasData) {
                    return Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: snapshot.data!.docs
                            .map((events) => event(events))
                            .toList(),
                      ),
                    );
                  }
                  return Text("there are no events");
                },
              ),
              SizedBox(height: 29),
              Padding(
                padding: EdgeInsets.only(right: 250),
                child: Text(
                  "Read Blogs",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 18),
              StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection("blogs").snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasData) {
                    return Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: snapshot.data!.docs
                            .map((blogs) => event(blogs))
                            .toList(),
                      ),
                    );
                  }
                  return Text("there are no events");
                },
              ),
              SizedBox(height: 20),
            ]),
          ),
        ),
      ),
    );
  }
}
