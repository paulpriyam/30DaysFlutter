import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter01/model/catalog.dart';
import 'package:flutter01/pages/detailsPage.dart';
import 'package:flutter01/utils/routes.dart';
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
    // await Future.delayed(Duration(seconds: 4));
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
      appBar: AppBar(title: const Text("My App")),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [HomePageHeaderWidget(), CatalogListView()],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, MyRoutes.cartPageRoute);
        },
        child: Icon(CupertinoIcons.cart),
      ),
      drawer: const MyDrawer(),
    );
  }
}

class HomePageHeaderWidget extends StatelessWidget {
  const HomePageHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Catalog App",
            style: TextStyle(color: Colors.deepPurple, fontSize: 30),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Trending Products",
            style: TextStyle(fontSize: 20, color: Colors.deepPurple),
          )
        ],
      ),
    );
  }
}

class CatalogListView extends StatelessWidget {
  const CatalogListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: (ItemList.items.isNotEmpty)
            ? ListView.builder(
                itemCount: ItemList.items.length,
                itemBuilder: (context, index) {
                  final item = ItemList.items[index];
                  return ItemWidget(item: item);
                })
            : Container(
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ));
  }
}
