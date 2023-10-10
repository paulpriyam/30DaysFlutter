import 'package:flutter/material.dart';
import 'package:flutter01/pages/homePage.dart';
import 'package:flutter01/pages/loginPage.dart';
import 'package:flutter01/utils/routes.dart';
import 'package:flutter01/widgets/theme.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => MyHomePage()
      },
    );
  }
}
