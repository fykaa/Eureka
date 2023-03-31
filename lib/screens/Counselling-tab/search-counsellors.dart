import 'package:career_counselling/screens/Counselling-tab/find-counsellors.dart';
import 'package:career_counselling/screens/HomeScreen/homeBottomBar.dart';
import 'package:flutter/material.dart';

class search_counsellors extends StatefulWidget {
  const search_counsellors({super.key});

  @override
  State<search_counsellors> createState() => _search_counsellorsState();
}

class _search_counsellorsState extends State<search_counsellors> {
  var _counsellorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        // appBar: AppBar(
        //   elevation: 0,
        //   leading: Icon(Icons.arrow_back),
        // ),
        body: Container(
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFFE0F4A2), Color(0xFFD3F36B), Color(0xFFE0F4A2)],
      )),
      // ignore: prefer_const_literals_to_create_immutables
      child: Padding(
        padding: EdgeInsets.only(left: 0, top: 44),
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [
              IconButton(
                padding: EdgeInsets.only(right: 320),
                icon: Icon(Icons.arrow_back),
                color: Colors.black,
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeBottomBar())),
              ),
              SizedBox(height: 32),
              Padding(
                padding: EdgeInsets.only(left: 0, right: 200),
                child: Text(
                  "Get Free",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 140),
                child: Text(
                  "Counselling",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 11),
              Text(
                "Enter your location to find counselors near you",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 24),
              SizedBox(
                width: 325,
                child: TextField(
                  maxLines: 1,
                  controller: _counsellorController,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFD3F36B),
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(0, 0, 0, 1)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(0, 0, 0, 1)),
                      ),
                      hintText: "ex: Pune",
                      hintStyle: TextStyle(color: Colors.black),
                      suffixIcon: IconButton(
                        // onPressed: _loginemailcontroller.clear,
                        onPressed: () {},
                        icon: Icon(
                          Icons.place,
                          color: Colors.black,
                        ),
                      )),
                ),
              ),
              SizedBox(height: 24),
              SizedBox(
                width: 325,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => find_counsellors(
                              location: _counsellorController.text)),
                    );
                  },
                  child: Text(
                    "Search",
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
              SizedBox(height: 210),
            ],
          ),
        ),
      ),
    ));
  }
}
