import 'package:cafeapp/components/ordersList.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cafeapp/components/class/Orders.dart';
import 'package:cafeapp/components/ordersList.dart';

// Stateful
class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  //Menu list
  List<Orders> orders = [
    Orders("ลาเต้", "40", "1"),
    Orders("มอคค่า", "50", "2"),
    Orders("คาปูชิโน่", "60", "3"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          child: Column(
            children: [
              // List of orders
              Expanded(
                child: ListView.builder(
                  itemCount: orders.length,
                  itemBuilder: (context, i) {
                    Orders food = orders[i];
                    return OrdersList(
                      name: food.name,
                      price: food.price,
                      amount: food.amount,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      //container order button
      bottomNavigationBar: Container(
        child: Row(
          children: [
            Text("  ราคารวม  บาท",
                style: GoogleFonts.notoSansThai(fontSize: 18)),
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
                child: Text("สั่งอาหาร ",
                    style: GoogleFonts.notoSansThai(fontSize: 16))),
          ],
        ),
      ),
    );
  }
}
