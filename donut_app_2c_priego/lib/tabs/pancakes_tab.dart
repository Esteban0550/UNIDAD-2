
import 'package:donut_app_2c/utils/donut_tile.dart';
import 'package:flutter/material.dart';

class PancakesTab extends StatelessWidget {
  final Function addToCart; // Recibimos la función addToCart
 
  // Lista de donas
  final List donutsOnSale = [
    [
      "Classic Pancake",
      "Kryspy Kreme",
      "36",
      Colors.blue,
      "lib/images/Pancake1.png"
    ],
    [
      "Strawberry Pancake",
      "Dunkin donuts",
      "45",
      Colors.red,
      "lib/images/Pancake2.png"
    ],
    [
      "Blueberry Pancake",
      "Aurrera",
      "84",
      Colors.purple,
      "lib/images/Pancake3.png"
    ],
    [
      "Chocolate Pancake",
      "Costco",
      "95",
      Colors.brown,
      "lib/images/Pancake4.png"
    ],
    [
      "Banana Pancake",
      "Kryspy Kreme",
      "36",
      Colors.yellow,
      "lib/images/Pancake5.png"
    ],
    [
      "Nutella Pancake",
      "Dunkin donuts",
      "45",
      Colors.orange,
      "lib/images/Pancake6.png"
    ],
    [
      "Caramel Pancake",
      "Aurrera",
      "84",
      Colors.green,
      "lib/images/Pancake7.png"
    ],
    [
      "Cinnamon Pancake",
      "Costco",
      "95",
      Colors.cyan,
      "lib/images/Pancake8.png"
    ],
  ];
 
  // Constructor
  PancakesTab({super.key, required this.addToCart});
 
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