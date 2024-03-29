import 'package:flutter/material.dart';
import 'package:food_shop_ui/item.dart';
import 'package:food_shop_ui/item_description.dart';
import 'package:food_shop_ui/onboarding.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Fruit Shop UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const OnboardingScreen(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _advancedDrawerController = AdvancedDrawerController();

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdropColor: Colors.pinkAccent[400],
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      drawer: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(left: 10),
          child: ListTileTheme(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            tileColor: Colors.red[300],
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                    width: 128.0,
                    height: 128.0,
                    margin: const EdgeInsets.only(
                      top: 25.0,
                      bottom: 64,
                    ),
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      color: Colors.black26,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 80,
                      color: Colors.white,
                    )),
                const SizedBox(height: 10),
                ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.account_circle_rounded),
                  title: const Text('Profile'),
                ),
                const SizedBox(height: 10),
                ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.favorite),
                  title: const Text('Favourites'),
                ),
                const SizedBox(height: 10),
                ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.shopping_cart_rounded),
                  title: const Text('Cart'),
                ),
                const SizedBox(height: 10),
                ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.settings),
                  title: const Text('Settings'),
                ),
                const SizedBox(height: 10),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 16.0,
                  ),
                  child: const Text(
                    'Fruity',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                        color: Colors.white70),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white.withOpacity(0.1),
          leading: IconButton(
            onPressed: _handleMenuButtonPressed,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: Icon(
                    value.visible ? Icons.clear : Icons.widgets_outlined,
                    size: 40,
                    color: Colors.black,
                    key: ValueKey<bool>(value.visible),
                  ),
                );
              },
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.all(10),
              child: Icon(
                Icons.notifications_rounded,
                color: Colors.grey,
                size: 30,
              ),
            ),
          ],
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Fruit and berries",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.1),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide.none),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                child: GridView.count(
                  childAspectRatio: 1.0 / 1.5,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  physics: const BouncingScrollPhysics(),
                  crossAxisCount: 2,
                  children: gridItem()
                      .map((item) => getGridItem(item, context))
                      .toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget getGridItem(Item item, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => ItemDetail(
                    item: item,
                  )));
    },
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: item.color,
      elevation: 0.3,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              item.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              item.price.toString() + item.priceDeccription,
              style: TextStyle(color: Colors.grey[700]),
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
                child: Hero(
                    tag: item.imageAsset, child: Image.asset(item.imageAsset))),
            InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text(
                      "Add to cart",
                      style: TextStyle(fontSize: 16),
                    ),
                    Icon(
                      Icons.shopping_cart,
                      size: 16,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
