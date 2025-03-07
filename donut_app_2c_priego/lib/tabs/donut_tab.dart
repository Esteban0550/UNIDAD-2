import 'package:donut_app_2c/utils/donut_tile.dart';
import 'package:flutter/material.dart';

class DonutTab extends StatelessWidget {
  // Lista de donas
  final List donutsOnSale = [
    // [ donutFlavor, donutPrice, donutColor, imageName ]
    ["Ice Cream", "Krispy Cream", "36", Colors.blue, "lib/images/icecream_donut.png"],
    ["Strawberry", "Dunkin Donuts", "45", Colors.red, "lib/images/strawberry_donut.png"],
    ["Grape Ape", "Ahorrera", "84", Colors.purple, "lib/images/grape_donut.png"],
    ["Choco", "PriegoStore", "95", Colors.brown, "lib/images/chocolate_donut.png"],
  ];

  DonutTab({super.key});

  @override
  Widget build(BuildContext context) {
    // Widget para usar cuadrícula
    return GridView.builder(
      // Cuantos elementos hay en la cuadrícula
      itemCount: donutsOnSale.length,
      padding: EdgeInsets.all(12),
      // o
      // Cómo se distribuirán los elementos
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        // Cuantas columnas
        crossAxisCount: 2,
        // Relación aspecto (Proporción)
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
        );
      },
    );
  }
}
