import 'package:cafeapp/components/menuList.dart';
import 'package:flutter/material.dart';
import '../models/Menu.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Menu> menu = [
      Menu(1, "ลาเต้", 40),
      Menu(2, "มอคค่า", 50),
      Menu(3, "คาปูชิโน่", 60),
      Menu(4, "ทดสอบ", 70),
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: ListView.builder(
            itemCount: menu.length,
            itemBuilder: (context, i) {
              Menu food = menu[i];
              return MenuList(menu: food);
            }),
      ),
    );
    ;
  }
}
