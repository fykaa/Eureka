// ignore_for_file: prefer_const_constructors

import 'package:career_counselling/screens/Counselling-tab/counsellors-notif.dart';
import 'package:career_counselling/screens/loginScreen.dart';
import 'package:career_counselling/widgets/select_counsellor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class find_counsellors extends StatefulWidget {
  final String location;
  const find_counsellors({super.key, required this.location});

  @override
  State<find_counsellors> createState() => _find_counsellorsState();
}

class _find_counsellorsState extends State<find_counsellors> {
  List<String> images = [
    'assets/images/couns_1.jpg',
    'assets/images/couns_2.jpg',
    'assets/images/couns_3.jpg',
    'assets/images/couns_4.jpg',
    'assets/images/couns_5.jpg',
    'assets/images/couns_6.jpg',
  ];

  CollectionReference counsellor_location =
      FirebaseFirestore.instance.collection("Counsellors");

  // var counsellors = counsellor_location;

  Future<List<dynamic>> loadData() async {
    QuerySnapshot querySnapshot = await counsellor_location.get();

    // Get data from docs and convert map to List
    final List<dynamic> allData =
        querySnapshot.docs.map((doc) => doc.data()).toList();

    // print(allData[0]["Name"]);
    return allData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFFE0F4A2), Color(0xFFD3F36B), Color(0xFFE0F4A2)],
      )),
      // ignore: prefer_const_literals_to_create_immutables4
      child: Padding(
        padding: EdgeInsets.only(left: 0, top: 44),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: 40),
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Colors.white,
                ),
                SizedBox(width: 40),
                Text(
                  "Find Counsellors",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 50),
                CircleAvatar(
                  backgroundColor: Color(0xffE6E6E6),
                  radius: 24,
                  backgroundImage: AssetImage("assets/images/student.jpg"),
                ),
              ],
            ),
            SizedBox(height: 24),
            Container(
              width: double.infinity,
              height: 567,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24)),
                  color: Color(0xFFD3F374)),
              child: Column(children: [
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("Counsellors")
                        .snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      // Future<List<dynamic>> counsellors = loadData();

                      if (snapshot.hasData) {
                        return FutureBuilder<List<dynamic>>(
                            future: loadData(),
                            builder: (BuildContext context,
                                AsyncSnapshot<List<dynamic>> snapshot) {
                              // print(snapshot.data);
                              var length_location = snapshot.data?[0]['Name'];

                              return ListView.builder(
                                itemCount: length_location?.length,
                                // itemCount: counsellors.length,
                                itemBuilder: (context, index) {
                                  // print(loadData());

                                  // print(snapshot.data?[0]['Name']);
                                  // DocumentSnapshot couns = snapshot.data!.docs[index];
                                  return Padding(
                                    padding: EdgeInsets.only(left: 40),
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 20),
                                      child: select_counsellor(
                                        name: length_location[index],
                                        image: images[index],
                                      ),
                                    ),
                                  );
                                },
                              );
                            });
                      }
                      return Text("there are no events");
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: SizedBox(
                    width: 120,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const counsellors_notif()));
                      },
                      child: Text(
                        "Contact",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ))),
                    ),
                  ),
                ),
              ]),
            )
          ],
        ),
      ),
    ));
  }
}
