import 'package:cafeapp/components/ordersList.dart';
import 'package:cafeapp/repository/order/OrderRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cafeapp/models/Order.dart';
import 'package:cafeapp/components/ordersList.dart';
import 'package:getwidget/getwidget.dart';

import 'package:get/get.dart';
import 'package:cafeapp/getX/order/logic.dart';

import '../getX/history/logic.dart';

class OrdersPage extends StatelessWidget {
  final logic = Get.put(OrderLogic());
  final historyLogic = Get.put(HistoryLogic());

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
                    if (logic.isLoading.value) {
                      return const GFLoader(
                        size: 100,
                      );
                    } else if (logic.orders.isEmpty) {
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
              GetX<OrderLogic>(
                builder: (logic) {
                  return ElevatedButton(
                      // make button disabled if no orders
                      onPressed: logic.orders.isEmpty
                          ? null
                          : () async {
                              // set loading state
                              logic.setLoading(true);

                              // RxList<dynamic> to to List<Order>
                              List<Order> orders = logic.orders
                                  .map((order) => Order(order.menuId,
                                      order.name, order.price, order.quantity))
                                  .toList();

                              // Submit order
                              await OrderRepository.createOrder(orders);

                              historyLogic.fetchHistory();

                              // Clear orders
                              logic.clearOrders();
                              // set loading state
                              logic.setLoading(false);
                              // Show success message
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('สั่งซื้อเรียบร้อย'),
                                ),
                              );
                            },
                      style: ElevatedButton.styleFrom(
                        primary:
                            logic.orders.isEmpty ? Colors.grey : Colors.brown,
                        onPrimary:
                            logic.orders.isEmpty ? Colors.grey : Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: logic.isLoading.value
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : Text(
                              logic.orders.isEmpty
                                  ? 'ไม่มีรายการสั่งซื้อ'
                                  : 'ยืนยันรายการ',
                              style: GoogleFonts.notoSansThai(fontSize: 16)));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
