import 'package:flutter/widgets.dart';

class Item {
  String title;
  Color color;
  double price;
  String priceDeccription;
  String imageAsset;
  String itemDescription;
  String categories;

  // Constructor
  Item(this.title, this.color, this.price, this.priceDeccription,
      this.imageAsset, this.itemDescription, this.categories);
}

List<Item> gridItem() {
  return <Item>[
    Item(
        "Banana",
        const Color(0xFFF4E389),
        1.25,
        " per/kg",
        "assets/images/bananas.png",
        "A banana is a curved, yellow fruit with a thick skin and soft sweet flesh. If you eat a banana every day for breakfast, your roommate might nickname you 'he monkey'. A banana is a tropical fruit that's quite popular all over the world. It grows in bunches on a banana tree",
        "Stone Fruit"),
    Item(
        "Blueberry",
        const Color(0xFFDFDFF8),
        2.50,
        " each",
        "assets/images/blueberry.png",
        "Blueberries are small round berries about 0.2 to 0.6 inches across. Their color can range from blue to purple. They are often eaten fresh but can also be enjoyed frozen, added to a wide variety of baked goods, or juiced or pureed.",
        "Tropical"),
    Item(
        "Dragon Fruit",
        const Color(0xFFEAB9E7),
        5.5,
        " per/kg",
        "assets/images/dragon_fruit.png",
        "Central Americans call it 'pitaya'. In Asia, it's a 'strawberry pear'. Today, you can buy dragon fruit throughout the U.S. Dragon fruit is juicy with a slightly sweet taste that some describe as a cross between a kiwi, a pear, and a watermelon. The seeds have a nutty flavor.",
        "Exotic"),
    Item(
        "Lychee",
        const Color(0xFFB4E0AA),
        10.2,
        " per/kg",
        "assets/images/lychee.png",
        "The lychee is a subtropical fruit known for its delicious flavor and sweet juicy aril. It originated in southern China, where it has been cultivated for over 4000 years. The edible portion of the fruit is a white- to cream-colored translucent pulp surrounding a glossy brown seed.",
        "Berries"),
    Item(
        "Mango",
        const Color(0xFFF8DA8A),
        7.2,
        " each",
        "assets/images/mango.png",
        "A mango is a sweet tropical fruit, and it's also the name of the trees on which the fruit grows. Ripe mangoes are juicy, fleshy, and delicious. Like peaches and plums, mangoes have an inedible pit at the center. Unlike these other fruits, the skin of a mango is very tough and also inedible.",
        "Melons"),
    Item(
        "Papaya",
        const Color(0xFFFFB570),
        2.35,
        " each",
        "assets/images/papaya.png",
        "Papaya is a tropical fruit, having oval or pear shape, measuring between 10 and 20cm and usually weighing between 500 and 1,000g, although it may even weigh up to 5kg. It is a berry of thin skin, of a green yellowish and orange colour. The pulp is of a red orange or yellow colour, sweet and very juicy.",
        "Apples"),
    Item(
        "Pineapple",
        const Color(0xFFFCF8D5),
        5.75,
        " per/kg",
        "assets/images/pineapple.png",
        "Pineapples have yellow or white pulp, fleshy, aromatic, juicy and sweet. In the fruit there is a fibrous axis that extends from the crown to the pedicle. Mature pineapples have a very singular fragrance, a beautiful colour and pleasant bittersweet taste.",
        "Pears"),
    Item(
        "Strawberry",
        const Color(0xFFFCE0E2),
        8.20,
        " per/kg",
        "assets/images/strawberry.png",
        "Strawberries are soft, sweet, bright red berries. They're also delicious. Strawberries have tiny edible seeds, which grow all over their surface. When ripe, strawberries smell wonderful and taste even better. You can make jam, pie, strawberry shortcake, and more with strawberries.",
        "Citrus"),
  ];
}
