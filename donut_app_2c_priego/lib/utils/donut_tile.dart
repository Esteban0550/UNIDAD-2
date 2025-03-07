import 'package:flutter/material.dart';

class DonutTile extends StatelessWidget {
  final String donutFlavor;
  final String donutPrice;
  final String donutBrand;
  // Es dinámico porque es de tipo color
  final dynamic donutColor;
  final String imageName;

  const DonutTile({
    super.key,
    required this.donutFlavor,
    required this.donutPrice,
    required this.donutBrand,
    this.donutColor,
    required this.imageName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SingleChildScrollView(  // Envuelve el Column en SingleChildScrollView
        child: Container(
          decoration: BoxDecoration(
            color: donutColor[50],
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: Column(
            children: [
              // price tag
              Row(
                // Alinea a la derecha
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: donutColor[100],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 8,
                    ),
                    child: Text(
                      '\$$donutPrice',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: donutColor[800],
                      ),
                    ),
                  ),
                ],
              ),
              // Donut Picture
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                child: Image.asset(
                  imageName,
                ),
              ),
              // Donut Flavor text
              Text(
                donutFlavor,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                donutBrand,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
              // Espacio entre textos
              SizedBox(
                height: 4,
              ),
  
              // Botones
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Botón de "favorito"
                  IconButton(
                    icon: Icon(
                    
                  
                      Icons.favorite_border,
                      color: Colors.pink[400], // Color Pink 400
                    ),
                    onPressed: () {
                      // Acción para el botón de favorito
                    },
                  ),
                  // Botón de "agregar"
                  IconButton(
                    icon: Icon(
                      Icons.add,
                      color: Colors.grey[800], // Color Grey 800
                    ),
                    onPressed: () {
                      // Acción para el botón de agregar
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
