import 'package:donut_app_2c/tabs/burger_tab.dart';

import 'package:donut_app_2c/tabs/donut_tab.dart';

import 'package:donut_app_2c/tabs/pancakes_tab.dart';

import 'package:donut_app_2c/tabs/pizza_tab.dart';

import 'package:donut_app_2c/tabs/smoothie_tab.dart';
import 'package:donut_app_2c/utils/Car_item.dart';

import 'package:donut_app_2c/utils/my_tab.dart';

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
 
  List<CartItem> cartItems = []; // Lista de productos en el carrito
 
  // Función para agregar productos al carrito
  void addToCart(String name, double price) {
    setState(() {
      bool itemExists = false;
      // Verificar si el producto ya está en el carrito
      for (var item in cartItems) {
        if (item.name == name) {
          item.quantity++; // Si ya existe, solo incrementamos la cantidad
          itemExists = true;
          break;
        }
      }
      if (!itemExists) {
        cartItems.add(
            CartItem(name: name, price: price)); // Si no existe, lo agregamos
      }
    });
  }
 
  // Obtener el total del carrito
  double get totalAmount {
    double total = 0;
    for (var item in cartItems) {
      total += item.totalPrice;
    }
    return total;
  }
 
  // Obtener la cantidad total de items en el carrito
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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Icon(Icons.menu, color: Colors.grey[800]),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: Icon(Icons.person),
            ),
          ],
        ),
        body: Column(
          children: [
            //Texto principal
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 18),
              child: Row(
                children: [
                  Text(
                    'I want to ',
                    style: TextStyle(fontSize: 32),
                  ),
                  Text('Eat',
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline))
                ],
              ),
            ),
 
            //Pestañas(TabBar)
            TabBar(tabs: myTabs),
            //Contenido de pestañas(TabBarView)
            Expanded(
              child: TabBarView(
                children: [
                  DonutTab(
                      addToCart:
                          addToCart), // Pasamos la función a las pestañas
                  BurgerTab(addToCart: addToCart),
                  SmoothieTab(addToCart: addToCart),
                  PancakesTab(addToCart: addToCart),
                  PizzaTab(addToCart: addToCart),
                ],
              ),
            ),
            //Cart Section
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Mostrar número de items y total
                        Text(
                          "$itemCount Items | \$${totalAmount.toStringAsFixed(2)}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("Delivery Charges Included"),
                      ],
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "View Cart",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
 