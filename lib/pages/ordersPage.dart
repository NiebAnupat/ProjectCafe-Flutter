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
  final List<Orders> _orders = [
    Orders("ลาเต้", 1, 1),
    Orders("มอคค่า", 2, 2),
    Orders("คาปูชิโน่", 30, 3),
  ];

  //Total price
  int _totalPrice = 0;

  x2() {
    for (var i = 0; i < _orders.length; i++) {
      setState(() {
        _orders[i].amount *= 2;
      });
      setState(() {
        // calculate total price
        _totalPrice = 0;
        for (var i = 0; i < _orders.length; i++) {
          _totalPrice += _orders[i].price * _orders[i].amount;
        }
      });
    }
  }

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
                  itemCount: _orders.length,
                  itemBuilder: (context, i) {
                    Orders food = _orders[i];
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
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Text('ราคารวม $_totalPrice บาท',
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
                  onPressed: x2,
                  child: Text("สั่งอาหาร",
                      style: GoogleFonts.notoSansThai(fontSize: 16))),
            ],
          ),
        ),
      ),
    );
  }
}
