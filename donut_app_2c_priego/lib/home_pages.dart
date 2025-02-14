import 'package:donut_app_2c/tabs/burger_tab.dart';
import 'package:donut_app_2c/tabs/donut_tab.dart';
import 'package:donut_app_2c/tabs/pancakes_tab.dart';
import 'package:donut_app_2c/tabs/pizza_tab.dart';
import 'package:donut_app_2c/tabs/smoothie_tab.dart';
import 'package:donut_app_2c/utils/my_tab.dart';
import 'package:flutter/material.dart';
 
class HomePage extends StatefulWidget {
  const HomePage({super.key});
 
  @override
  State<HomePage> createState() => _HomePageState();
}
 
class _HomePageState extends State<HomePage> {
List<Widget> myTabs =[
  const MyTab(iconPath: "lib/icons/donut.png"),
  const MyTab(iconPath: "lib/icons/burger.png"),
  const MyTab(iconPath: "lib/icons/smoothie.png"),
  const MyTab(iconPath: "lib/icons/pancakes.png"),
  const MyTab(iconPath: "lib/icons/pizza.png")
];
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          //icono izquierdo
          leading: Icon(Icons.menu, color: Colors.grey[800]),
          actions: [Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Icon(Icons.person),
          )],
        ),
      
        body: Column(
          children: [
            //texto princiál
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 18),
                 child: Row(
                   children: [
                     Text("I want to ",style: TextStyle(fontSize: 32),),
                     Text("Eat",
                      style:
                        TextStyle(
                          //size
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                 
                          //subrayado
                          decoration: TextDecoration.underline,
                        ))
                   ],
                 ),
               ),
              
      
      
              //pdstañas
              TabBar(tabs: myTabs),
      
      
              //contenido de pestañas
      
              Expanded(
                child: TabBarView(children: [
                  DonutTab(),
                  BurgerTab(),
                  SmoothieTab(),
                  PancakesTab(),
                  PizzaTab()
                ]
                ),
              )
              //carrito
          ],
          
        ),
         
      
        
      ),
    );
  }
}