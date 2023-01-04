import 'package:cafeapp/components/ordersList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cafeapp/models/Order.dart';
import 'package:cafeapp/components/ordersList.dart';

import 'package:get/get.dart';
import 'package:cafeapp/getX/order/logic.dart';

class OrdersPage extends StatelessWidget {
  final logic = Get.put(OrderLogic());

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          child: Column(
            children: [
              // List of orders
              Expanded(
                child: GetX<OrderLogic>(
                  initState: (_) {},
                  builder: (logic) {
                    if (logic.orders.isEmpty) {
                      return Center(
                        child: Text('ไม่มีรายการสั่งซื้อ',
                            style: GoogleFonts.notoSansThai(
                                fontSize: 25,
                                color: Colors.grey.withOpacity(0.8))),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: logic.orders.length,
                        itemBuilder: (context, i) {
                          return OrdersList(orderMenu: logic.orders[i]);
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      //container order button
      bottomNavigationBar: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              GetX<OrderLogic>(
                initState: (_) {},
                builder: (logic) {
                  return Text('ราคารวม ${logic.total} บาท',
                      style: GoogleFonts.notoSansThai(fontSize: 18));
                },
              ),
              Spacer(),
              // Order button
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.brown,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {},
                  child: Text("สั่งอาหาร",
                      style: GoogleFonts.notoSansThai(fontSize: 16))),
            ],
          ),
        ),
      ),
    );
  }
}
