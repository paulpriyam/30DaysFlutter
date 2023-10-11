class Item {
  final int id;
  final String name;
  final String desc;
  final String color;
  final String image;
  final num price;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.color,
      required this.image,
      required this.price});
}

class ItemList {
  static final items = [
    Item(
        id: 1,
        name: "item1",
        desc: "this is item 1",
        color: "#20203",
        image:
            "https://i0.wp.com/ayrshirecreditunion.co.uk/wp-content/uploads/2020/01/undraw_Mobile_app_p3ts.png?fit=1210%2C914&ssl=1",
        price: 2000)
  ];
}
