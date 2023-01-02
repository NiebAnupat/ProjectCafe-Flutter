import 'package:cafeapp/components/menuList.dart';
import 'package:flutter/material.dart';
import '../components/class/Menu.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Menu> menu = [
      Menu("ลาเต้", 40),
      Menu("มอคค่า", 50),
      Menu("คาปูชิโน่", 60),
      Menu("ทดสอบ", 70),
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: ListView.builder(
            itemCount: menu.length,
            itemBuilder: (context, i) {
              Menu food = menu[i];
              return MenuList(name: food.name, price: food.price);
            }),
      ),
    );
    ;
  }
}
