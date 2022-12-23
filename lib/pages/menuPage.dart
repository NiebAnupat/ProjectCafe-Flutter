import 'package:flutter/material.dart';
import 'package:cafeapp/components/menuCafe.dart';

// Stateful
class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  //Menu list
  List<menuCafe> menu = [
    menuCafe("ลาเต้", "40"),
    menuCafe("มอคค่า", "50"),
    menuCafe("คาปูชิโน่", "60"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: content(),
    );
  }

  Widget content() {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: ListView.builder(
        itemCount: menu.length,
        itemBuilder: (context, i) {
          menuCafe food = menu[i];
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(1.5),
              child: ListTile(
                title: Text(food.name, style: TextStyle(fontSize: 18)),
                subtitle: Text(
                  "ราคา " + food.price + " บาท",
                  style: TextStyle(fontSize: 15),
                ),

                // Add menu button
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.add),
                ),
              ),
            ),
          );

          // Card(
          //   color: Colors.brown[200],
          //   child: Padding(
          //     padding: const EdgeInsets.all(1.5),
          //     child: ListTile(
          //       title: Text(food.name, style: TextStyle(fontSize: 18)),
          //       subtitle: Text("ราคา " + food.price + " บาท",
          //           style: TextStyle(fontSize: 15)),

          //       // Add menu button
          //       trailing: IconButton(
          //         onPressed: () {},
          //         icon: Icon(Icons.add),
          //       ),
          //     ),
          //   ),
          // );
        },
      ),
    );
  }
}
