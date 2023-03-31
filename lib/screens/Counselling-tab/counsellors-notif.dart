import 'package:career_counselling/widgets/notification.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class counsellors_notif extends StatefulWidget {
  const counsellors_notif({super.key});

  @override
  State<counsellors_notif> createState() => _counsellors_notifState();
}

class _counsellors_notifState extends State<counsellors_notif> {
  List<String> images = [
    'assets/images/couns_1.jpg',
    'assets/images/couns_2.jpg',
    'assets/images/couns_3.jpg',
    'assets/images/couns_4.jpg',
    'assets/images/couns_5.jpg',
    'assets/images/couns_6.jpg',
  ];

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
                  "Notifications",
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
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("Notifications")
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (snapshot.hasData) {
                    // print(snapshot.data);

                    return ListView.builder(
                      itemCount: snapshot.data?.docs.length,
                      // itemCount: counsellors.length,
                      itemBuilder: (context, index) {
                        // print(loadData());

                        print(snapshot.data?.docs[index]['Name']);
                        // DocumentSnapshot couns = snapshot.data!.docs[index];
                        return Padding(
                          padding: EdgeInsets.only(left: 40),
                          child: Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: notification(
                              name: snapshot.data?.docs[index]["Name"],
                              image: images[index],
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return Text("there are no events");
                },
              ),
            )
          ],
        ),
      ),
    ));
  }
}
