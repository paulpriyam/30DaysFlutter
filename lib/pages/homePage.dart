import 'package:flutter/material.dart';
import 'package:flutter01/widgets/drawer.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My App")),
      body: Center(
        child: Container(
          child: Text("My First Flutter tutorial"),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
