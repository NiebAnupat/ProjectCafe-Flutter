import 'package:flutter/material.dart';
import 'package:cafeapp/components/menuCafe.dart';

// Stateful
class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  // All orders
  List<menuCafe> orders = [
    menuCafe("ลาเต้", "40"),
    menuCafe("มอคค่า", "50"),
    menuCafe("คาปูชิโน่", "60"),
    menuCafe("คาปูชิโน่", "60"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: content(),
    );
  }

  Widget content() {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        child: Column(
          children: [
            // List of orders
            Expanded(
              child: ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, i) {
                  menuCafe food = orders[i];
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(1.5),
                      child: ListTile(
                        title: Text(food.name, style: TextStyle(fontSize: 18)),
                        subtitle: Text(
                          "จำนวน ",
                          style: TextStyle(fontSize: 15),
                        ),

                        // delete menu button
                        trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.minimize),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Total price
            Container(
              child: Row(
                children: [
                  Text("ราคารวม " + " บาท", style: TextStyle(fontSize: 18)),
                  Spacer(),

                  // Order button
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("สั่งอาหาร"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
