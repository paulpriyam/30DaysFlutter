import 'package:flutter/material.dart';
import 'package:flutter01/pages/homePage.dart';
import 'package:flutter01/pages/loginPage.dart';
import 'package:flutter01/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: MyRoutes.loginRoute,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => MyHomePage()
      },
    );
  }
}
