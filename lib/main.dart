import 'package:flutter/material.dart';
import 'package:twist_appointment_app/Login/LoginPage.dart';

import 'HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => AppState();
}

class AppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.purple,
      ),
      home: LoginPage(),
    );
  }

}