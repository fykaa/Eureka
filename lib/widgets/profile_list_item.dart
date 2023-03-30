import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:career_counselling/screens/Profile-tab/profile-screen.dart';

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool hasNavigation;

  const ProfileListItem({
    Key? key,
    required this.icon,
    required this.text,
    this.hasNavigation = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.symmetric(
        horizontal: 14,
      ).copyWith(
        bottom: 12,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 2,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color(0xFFAED530),
      ),
      child: Row(
        children: <Widget>[
          SizedBox(width: 20),
          Text(
            this.text,
          ),
          Spacer(),
          if (this.hasNavigation)
            Icon(
              Icons.arrow_right,
            ),
        ],
      ),
    );
  }
}
