import 'package:flutter/widgets.dart';

class Item {
  String title;
  Color color;
  String price;
  String priceDeccription;
  String imageAsset;
  // Constructor
  Item(this.title, this.color, this.price, this.priceDeccription,
      this.imageAsset);
}

List<Item> gridItem() {
  return <Item>[
    Item("Banana", const Color(0xFFF4E389), "1.25 ", "per/kg",
        "assets/images/bananas.png"),
    Item("Blueberry", const Color(0xFFDFDFF8), "2.50 ", "each",
        "assets/images/blueberry.png"),
    Item("Dragon Fruit", const Color(0xFFEAB9E7), "5.25 ", "per/kg",
        "assets/images/dragon_fruit.png"),
    Item("Lychee", const Color(0xFFB4E0AA), "10.2 ", "per/kg",
        "assets/images/lychee.png"),
    Item("Mango", const Color(0xFFF8DA8A), "7.6 ", "each",
        "assets/images/mango.png"),
    Item("Papaya", const Color(0xFFFFB570), "2.35 ", "each",
        "assets/images/papaya.png"),
    Item("Pineapple", const Color(0xFFFCF8D5), "5.75", "per/kg",
        "assets/images/pineapple.png"),
    Item("Strawberry", const Color(0xFFFCE0E2), "8.50 ", "per/kg",
        "assets/images/strawberry.png"),
  ];
}
