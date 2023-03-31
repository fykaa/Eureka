import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/profile_list_item.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    var profileInfo = Expanded(
      child: Column(
        children: <Widget>[
          Container(
            height: 80,
            width: 80,
            margin: EdgeInsets.only(top: 10),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/student.jpg"),
            ),
          ),
          SizedBox(height: 15),
          Text('User',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          // Text(
          //   "email",
          //   style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          // ),
          SizedBox(height: 20),
        ],
      ),
    );

    var header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        profileInfo,
      ],
    );

    return Builder(
      builder: (context) {
        return Scaffold(
            body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFE0F4A2), Color(0xFFD3F36B), Color(0xFFE0F4A2)],
          )),
          child: Column(
            children: <Widget>[
              SizedBox(height: 5),
              header,
              Expanded(
                child: ListView(
                  children: <Widget>[
                    ProfileListItem(
                      icon: Icons.person,
                      text: 'Account',
                    ),
                    ProfileListItem(
                      icon: Icons.person,
                      text: 'Settings',
                    ),
                    ProfileListItem(
                      icon: Icons.person,
                      text: 'Your Counsellors',
                    ),
                    ProfileListItem(
                      icon: Icons.person,
                      text: 'Help & Support',
                    ),
                    ProfileListItem(
                      icon: Icons.person,
                      text: 'Invite a Friend',
                    ),
                    ProfileListItem(
                      icon: Icons.person,
                      text: 'Logout',
                      hasNavigation: false,
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
      },
    );
  }
}
