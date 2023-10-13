import 'package:flutter/material.dart';
import 'package:flutter01/model/catalog.dart';

class DetailsPage extends StatelessWidget {
  final Item item;

  const DetailsPage({super.key, required this.item}) : assert(item != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Card(
          child: Image.network(item.image),
        ),
      ),
    );
  }
}
