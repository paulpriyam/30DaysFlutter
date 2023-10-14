import 'package:flutter/material.dart';
import 'package:flutter01/model/catalog.dart';

class DetailsPage extends StatelessWidget {
  final Item item;

  const DetailsPage({super.key, required this.item}) : assert(item != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Hero(
                  tag: Key(item.id.toString()),
                  child: Image.network(item.image)),
            ),
            SizedBox(height: 10,),
            Text(
              item.name,
              style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10,),
            Text(item.desc,style: TextStyle(color: Colors.deepPurple,fontSize: 20,fontWeight: FontWeight.w100),)
          ],
        ),
      ),
      bottomNavigationBar: Container(
          color: Colors.white70,
          height: 60,
          child: ListTile(
            leading: Text(
              "\$${item.price.toString()}",
              style: TextStyle(fontSize: 20, color: Colors.deepPurple),
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
            ),
          )),
    );
  }
}
