import 'package:flutter/material.dart';
import 'package:untitled2/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      home: LoginPage(),
    );
  }
}




