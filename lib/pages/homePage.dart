import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter01/model/catalog.dart';
import 'package:flutter01/pages/detailsPage.dart';
import 'package:flutter01/widgets/drawer.dart';
import 'package:flutter01/widgets/itemWidget.dart';
import 'dart:convert';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 4));
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodedJson = jsonDecode(catalogJson);
    var products = decodedJson["products"];
    ItemList.items =
        List.from(products).map((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My App")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (ItemList.items.isNotEmpty)
            ? GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16),
                itemBuilder: (context, index) {
                  final item = ItemList.items[index];
                  return GridTile(
                    child: Image.network(item.image),
                    header: Text(item.name),
                    footer: Text(item.price.toString()),
                  );
                },
                itemCount: ItemList.items.length,
              )
            : Container(
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
      ),
      drawer: MyDrawer(),
    );
  }
}
