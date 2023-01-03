import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cafeapp/models/Order.dart';

import '../getX/order/logic.dart';

class OrdersList extends StatelessWidget {
  final Order orderMenu;

  OrdersList({required this.orderMenu});

  final orderController = Get.put(OrderLogic());

  @override
  Widget build(BuildContext context) {
    return GetX<OrderLogic>(
      builder: (orderController) {
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
              title: Text(
                orderMenu.name,
                style: GoogleFonts.notoSansThai(fontSize: 18),
              ),
              subtitle: Text(
                'ราคา ${orderMenu.price} บาท x ${orderController.orders[orderController.orders.indexWhere((element) => element.menuId == orderMenu.menuId)].quantity}',
                style: GoogleFonts.notoSansThai(fontSize: 15),
              ),

              // Add menu button
              trailing: IconButton(
                onPressed: () {
                  orderController.deleteOrder(orderMenu);
                },
                icon: const Icon(Icons.minimize),
              ),
            ),
          ),
        );
      },
    );
  }
}
