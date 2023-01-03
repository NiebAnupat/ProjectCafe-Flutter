import 'package:cafeapp/models/Order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart ';

import '../getX/order/logic.dart';
import '../models/Menu.dart';

class MenuList extends StatelessWidget {
  Menu menu;

  MenuList({required this.menu});

  final orderController = Get.put(OrderLogic());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(1.5),
        child: ListTile(
          title: Text(menu.name, style: GoogleFonts.notoSansThai(fontSize: 18)),
          subtitle: Text(
            'ราคา ${menu.price} บาท',
            style: GoogleFonts.notoSansThai(fontSize: 15),
          ),

          // Add menu button
          trailing: IconButton(
            onPressed: () {
              orderController
                  .addOrder(Order(menu.id, menu.name, menu.price, 1));
            },
            icon: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
