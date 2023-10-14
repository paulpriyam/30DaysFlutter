import 'package:flutter/material.dart';
import 'package:flutter01/model/catalog.dart';
import 'package:flutter01/pages/detailsPage.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({super.key, required this.item}) : assert(item != null);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailsPage(item: item)));
            },
            leading: Hero(
                tag: Key(item.id.toString()), child: Image.network(item.image)),
            title: Text(item.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.desc),
                Text("\$${item.price}",
                    style: TextStyle(color: Colors.deepPurple),
                    textScaleFactor: 1.2)
              ],
            ),
            trailing: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(backgroundColor:
                  MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.black38;
                }
                return Colors.amber;
              })),
              child: Text("Buy Now"),
            )),
      ),
    );
  }
}
