import 'package:donut_app_2c/utils/donut_tile.dart';
import 'package:flutter/material.dart';

class BurgerTab extends StatelessWidget {
  final Function addToCart; // Recibimos la función addToCart
 
  // Lista de donas
  final List donutsOnSale = [
    [
      "Cheese Burger",
      "McDonald's",
      "50",
      Colors.blue,
      "lib/images/Burger1.png"
    ],
    [
      "Veggie Burger",
      "Burger King",
      "55",
      Colors.red,
      "lib/images/Burger2.png"
    ],
    ["BBQ Burger", "Five Guys", "60", Colors.purple, "lib/images/Burger3.png"],
    ["Chicken Burger", "Wendy's", "65", Colors.brown, "lib/images/Burger4.png"],
    [
      "Double Cheeseburger",
      "Shake Shack",
      "70",
      Colors.orange,
      "lib/images/Burger5.png"
    ],
    ["Bacon Burger", "In-N-Out", "75", Colors.green, "lib/images/Burger6.png"],
    [
      "Mushroom Burger",
      "Hardee's",
      "80",
      Colors.grey,
      "lib/images/Burger7.png"
    ],
    [
      "Spicy Chicken Burger",
      "Jack in the Box",
      "85",
      Colors.yellow,
      "lib/images/Burger8.png"
    ],
  ];
 
  // Constructor
  BurgerTab({super.key, required this.addToCart});
 
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