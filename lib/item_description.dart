import 'package:flutter/material.dart';
import 'package:food_shop_ui/item.dart';

class ItemDetail extends StatefulWidget {
  // pada stateful jika ingin mengakses variabel dibawah ini di widget build harus menggunakan keyword widget terlebih dahulu
  final Item item;
  const ItemDetail({Key? key, required this.item}) : super(key: key);

  @override
  State<ItemDetail> createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {
  bool isFavorite = false;
  int jumlahItem = 0;
  double total = 0;

  void addItem() {
    setState(() {
      jumlahItem++;
      total = widget.item.price * jumlahItem;
    });
  }

  void removeItem() {
    setState(() {
      jumlahItem--;
      if (jumlahItem <= 0) {
        jumlahItem = 1;
        total = total + widget.item.price;
      }
      total = total - widget.item.price;
    });
  }

  void favorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  void initState() {
    super.initState();
    addItem();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.item.color,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(15)),
                      child: const Icon(Icons.keyboard_arrow_left_rounded)),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 120,
                child: Center(
                  child: Hero(
                      tag: widget.item.imageAsset,
                      child: Image.asset(widget.item.imageAsset)),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                  child: Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(50))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.item.title,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    const Text(
                      "1 each",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: removeItem,
                              child: Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.2),
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        bottomLeft: Radius.circular(15))),
                                child: const Icon(Icons.remove),
                              ),
                            ),
                            Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.3)),
                                child: Center(
                                  child: Text(jumlahItem.toString()),
                                )),
                            GestureDetector(
                              onTap: addItem,
                              child: Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.2),
                                    borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(15),
                                        bottomRight: Radius.circular(15))),
                                child: const Icon(Icons.add),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          // mengambil 2 angka saja
                          "\$${total.toStringAsFixed(2)}",
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Product Description",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    // ignore: sized_box_for_whitespace
                    Container(
                      height: 150,
                      // agar text bisa di scroll
                      child: SingleChildScrollView(
                        child: Text(
                          widget.item.itemDescription,
                          style: const TextStyle(color: Colors.grey),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: widget.item.color)),
                            width: 65,
                            height: 65,
                            child: IconButton(
                              onPressed: () {
                                favorite();
                              },
                              icon: isFavorite
                                  ? Icon(
                                      Icons.favorite,
                                      color: widget.item.color,
                                    )
                                  : const Icon(Icons.favorite_border),
                            ),
                          ),
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            height: 65,
                            minWidth: 210,
                            color: widget.item.color,
                            onPressed: () {},
                            child: const Text(
                              "Add to cart",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
