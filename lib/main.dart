import 'package:flutter/material.dart';
import 'package:flutter01/homePage.dart';
import 'package:flutter01/loginPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      routes: {
        "/": (context) => LoginPage(),
        "/home": (context) => MyHomePage()
      },
    );
  }
}
