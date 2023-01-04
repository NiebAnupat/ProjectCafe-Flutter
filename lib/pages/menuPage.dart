import 'package:cafeapp/components/menuList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../getX/menu/logic.dart';
import '../models/Menu.dart';

class MenuPage extends StatelessWidget {
  final logic = Get.put(MenuLogic());

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: GetX<MenuLogic>(
          builder: (logic) {
            return ListView.builder(
                itemCount: logic.menu.length,
                itemBuilder: (context, i) {
                  Menu food = logic.menu[i];
                  return MenuList(menu: food);
                });
          },
        ),
      ),
    );
    ;
  }
}
