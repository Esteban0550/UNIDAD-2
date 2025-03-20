import 'package:donut_app_2c/utils/donut_tile.dart';
import 'package:flutter/material.dart';

class PizzaTab extends StatelessWidget {
  final Function addToCart; // Recibimos la función addToCart
 
  // Lista de donas
  final List donutsOnSale = [
    [
      "Margherita Pizza",
      "Domino's",
      "36",
      Colors.green,
      "lib/images/pizza1.png"
    ],
    ["Pepperoni Pizza", "Pizza Hut", "45", Colors.red, "lib/images/pizza2.png"],
    [
      "Vegetarian Pizza",
      "Papa John's",
      "84",
      Colors.purple,
      "lib/images/pizza3.png"
    ],
    [
      "BBQ Chicken Pizza",
      "Little Caesars",
      "95",
      Colors.orange,
      "lib/images/pizza4.png"
    ],
    [
      "Hawaiian Pizza",
      "Blaze Pizza",
      "40",
      Colors.yellow,
      "lib/images/pizza5.png"
    ],
    [
      "Cheese Pizza",
      "Marco's Pizza",
      "50",
      Colors.blue,
      "lib/images/pizza6.png"
    ],
    [
      "Meat Lovers Pizza",
      "Round Table Pizza",
      "60",
      Colors.brown,
      "lib/images/pizza7.png"
    ],
    [
      "Buffalo Chicken Pizza",
      "Papa Murphy's",
      "55",
      Colors.red,
      "lib/images/pizza8.png"
    ],
  ];
 
  // Constructor
  PizzaTab({super.key, required this.addToCart});
 
  @override
  Widget build(BuildContext context) {
    // Widget para usar cuadrícula
    return GridView.builder(
      // Cuántos elementos hay en la cuadrícula
      itemCount: donutsOnSale.length,
      padding: EdgeInsets.all(12),
      // Distribución de los elementos
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.6,
      ),
      itemBuilder: (context, index) {
        // Cada elemento individual
        return DonutTile(
          donutFlavor: donutsOnSale[index][0],
          donutBrand: donutsOnSale[index][1],
          donutPrice: donutsOnSale[index][2],
          donutColor: donutsOnSale[index][3],
          imageName: donutsOnSale[index][4],
          onAddToCart: () {
            // Llamamos a la función addToCart
            addToCart(
                donutsOnSale[index][0], double.parse(donutsOnSale[index][2]));
          },
        );
      },
    );
  }
}
 