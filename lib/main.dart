import 'package:career_counselling/screens/Get-Started/getStarted_class.dart';
import 'package:career_counselling/screens/loginScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Poppins',
        appBarTheme: AppBarTheme(
          color: const Color(0xFFD3F36B),
        ),
      ),
      home: Splash(),
    );
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 10,
      backgroundColor: Color(0xFFD3F36B),
      navigateAfterSeconds: new MyHomePage(title: 'Flutter Demo Home Page'),
      title: new Text(
        'We care, we share, \nFor the future we prepare',
        textScaleFactor: 2,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.deepPurple,
            fontSize: 8,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w600),
      ),
      image: new Image.network(
          "https://cdn.discordapp.com/attachments/1086235658076573696/1091059303659618447/Screenshot_2023-03-30_232718-removebg-preview.png"),

      photoSize: 100.0,
      useLoader: false,
      // loaderColor: Colors.blue,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return loginScreen(); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
