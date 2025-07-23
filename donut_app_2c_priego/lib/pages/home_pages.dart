import 'package:donut_app_2c/tabs/burger_tab.dart';
import 'package:donut_app_2c/tabs/donut_tab.dart';
import 'package:donut_app_2c/tabs/pancakes_tab.dart';
import 'package:donut_app_2c/tabs/pizza_tab.dart';
import 'package:donut_app_2c/tabs/smoothie_tab.dart';
import 'package:donut_app_2c/utils/Car_item.dart';
import 'package:donut_app_2c/utils/my_tab.dart';
import 'package:donut_app_2c/pages/supermarket_page.dart'; // ✅ Agregado para navegar al SuperMarket
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> myTabs = [
    const MyTab(iconPath: 'lib/icons/donut.png'),
    const MyTab(iconPath: 'lib/icons/burger.png'),
    const MyTab(iconPath: 'lib/icons/smoothie.png'),
    const MyTab(iconPath: 'lib/icons/pancakes.png'),
    const MyTab(iconPath: 'lib/icons/pizza.png'),
  ];

  List<CartItem> cartItems = [];

  void addToCart(String name, double price) {
    setState(() {
      bool itemExists = false;
      for (var item in cartItems) {
        if (item.name == name) {
          item.quantity++;
          itemExists = true;
          break;
        }
      }
      if (!itemExists) {
        cartItems.add(CartItem(name: name, price: price));
      }
    });
  }

  double get totalAmount {
    double total = 0;
    for (var item in cartItems) {
      total += item.totalPrice;
    }
    return total;
  }

  int get itemCount {
    int count = 0;
    for (var item in cartItems) {
      count += item.quantity;
    }
    return count;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        // ✅ Drawer del maestro agregado
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 218, 113, 148),
                ),
                child: Text(
                  'Menu',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.store),
                title: const Text('SuperMarket'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SuperMarketPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          // ✅ Icono de menú funcional con Drawer
          iconTheme: IconThemeData(color: Colors.grey[800]),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 24.0),
              child: Icon(Icons.person),
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 36, vertical: 18),
              child: Row(
                children: const [
                  Text(
                    'I want to ',
                    style: TextStyle(fontSize: 32),
                  ),
                  Text(
                    'Eat',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
            TabBar(tabs: myTabs),
            Expanded(
              child: TabBarView(
                children: [
                  DonutTab(addToCart: addToCart),
                  BurgerTab(addToCart: addToCart),
                  SmoothieTab(addToCart: addToCart),
                  PancakesTab(addToCart: addToCart),
                  PizzaTab(addToCart: addToCart),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "$itemCount Items | \$${totalAmount.toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text("Delivery Charges Included"),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.shopping_cart_outlined,
                            color: Colors.white),
                        SizedBox(width: 10),
                        Text(
                          "View Cart",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
