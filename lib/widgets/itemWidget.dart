import 'package:flutter/material.dart';
import 'package:flutter01/model/catalog.dart';
import 'package:flutter01/pages/detailsPage.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({super.key, required this.item}) : assert(item != null);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DetailsPage(item: item)));
        },
        leading: Hero(
            tag: Key(item.id.toString()), child: Image.network(item.image)),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
          "\$${item.price}",
          style: TextStyle(color: Colors.deepPurple),
          textScaleFactor: 1.2,
        ),
      ),
    );
  }
}
