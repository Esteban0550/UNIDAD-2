import 'package:donut_app_2c/utils/donut_tile.dart';
import 'package:flutter/material.dart';

class SmoothieTab extends StatelessWidget {
  final Function addToCart; // Recibimos la función addToCart
 
  // Lista de donas
  final List donutsOnSale = [
    [
      "Berry Smoothie",
      "Jamba Juice",
      "36",
      Colors.blue,
      "lib/images/Smoothie1.png"
    ],
    [
      "Mango Smoothie",
      "Smoothie King",
      "45",
      Colors.orange,
      "lib/images/Smoothie2.png"
    ],
    [
      "Green Smoothie",
      "Tropicana",
      "84",
      Colors.green,
      "lib/images/Smoothie3.png"
    ],
    [
      "Banana Smoothie",
      "Starbucks",
      "95",
      Colors.yellow,
      "lib/images/Smoothie4.png"
    ],
    [
      "Strawberry Smoothie",
      "Dunkin Donuts",
      "36",
      Colors.red,
      "lib/images/Smoothie5.png"
    ],
    [
      "Tropical Smoothie",
      "Tropicana",
      "45",
      Colors.purple,
      "lib/images/Smoothie6.png"
    ],
    [
      "Pineapple Smoothie",
      "Jamba Juice",
      "84",
      Colors.yellow,
      "lib/images/Smoothie7.png"
    ],
    [
      "Acai Smoothie",
      "Smoothie King",
      "95",
      Colors.pink,
      "lib/images/Smoothie8.png"
    ],
  ];
 
  // Constructor
  SmoothieTab({super.key, required this.addToCart});
 
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