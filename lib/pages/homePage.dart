import 'package:flutter/material.dart';
import 'package:flutter01/model/catalog.dart';
import 'package:flutter01/pages/detailsPage.dart';
import 'package:flutter01/widgets/drawer.dart';
import 'package:flutter01/widgets/itemWidget.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(20, (index) => ItemList.items[0]);
    return Scaffold(
      appBar: AppBar(title: Text("My App")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context, index) {
            return ItemWidget(item: dummyList[index]);
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
