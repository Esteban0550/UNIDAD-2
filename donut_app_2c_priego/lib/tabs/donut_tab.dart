import 'package:donut_app_2c/utils/donut_tile.dart';
import 'package:flutter/material.dart';

class DonutTab extends StatelessWidget {
  final Function addToCart; // Recibimos la función addToCart
 
  // Lista de donas
  final List donutsOnSale = [
    [
      "Ice Cream",
      "Krispy Kreme",
      "36",
      Colors.blue,
      "lib/images/icecream_donut.png"
    ],
    [
      "Strawberry",
      "Dunkin Donuts",
      "45",
      Colors.red,
      "lib/images/strawberry_donut.png"
    ],
    ["Grape Ape", "Aurrera", "84", Colors.purple, "lib/images/grape_donut.png"],
    ["Choco", "Costco", "95", Colors.brown, "lib/images/chocolate_donut.png"],
    [
      "Ice Cream",
      "Krispy Kreme",
      "36",
      Colors.blue,
      "lib/images/icecream_donut.png"
    ],
    [
      "Strawberry",
      "Dunkin Donuts",
      "45",
      Colors.red,
      "lib/images/strawberry_donut.png"
    ],
    ["Grape Ape", "Aurrera", "84", Colors.purple, "lib/images/grape_donut.png"],
    ["Choco", "Costco", "95", Colors.brown, "lib/images/chocolate_donut.png"],
  ];
 
  // Constructor
  DonutTab({super.key, required this.addToCart});
 
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
        childAspectRatio: 1 / 1.5,
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