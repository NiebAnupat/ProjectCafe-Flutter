import 'package:cafeapp/components/menuList.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cafeapp/components/menuList.dart';

import '../components/menuCafe.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: ListView.builder(
            itemCount: menu.length,
            itemBuilder: (context, i) {
              menuCafe food = menu[i];
              return MenuList(name: food.name, price: food.price);
            }),
      ),
    );
  }
}
