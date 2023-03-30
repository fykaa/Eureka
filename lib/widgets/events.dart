import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Widget event(String type, QueryDocumentSnapshot doc) {
  _launchURLBrowser() async {
    var _url = Uri.parse(doc["event_website"]);

    await launchUrl(_url, mode: LaunchMode.externalApplication);
  }

  return Column(children: [
    InkWell(
      onTap: () => _launchURLBrowser(),
      child: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color(0xFFAED530),
          image: DecorationImage(
            image: type == "e"
                ? AssetImage('assets/images/events.jpg')
                : AssetImage('assets/images/blog.jpg'),
            fit: BoxFit.fill,
          ),
        ),
      ),
    ),
    SizedBox(height: 5),
    Text(
      doc["event_title"],
      style: TextStyle(
        color: Colors.black,
        fontSize: 10,
      ),
    )
  ]);
}
