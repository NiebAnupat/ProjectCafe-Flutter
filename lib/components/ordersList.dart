import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cafeapp/components/class/Orders.dart';

class OrdersList extends StatefulWidget {
  String name;
  int price;
  int amount;

  OrdersList(
      {super.key,
      required this.name,
      required this.price,
      required this.amount});

  @override
  State<OrdersList> createState() => _OrdersListState();
}

class _OrdersListState extends State<OrdersList> {
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
          title:
              Text(widget.name, style: GoogleFonts.notoSansThai(fontSize: 18)),
          subtitle: Text(
            "ราคา ${widget.price} บาท จำนวน ${widget.amount}",
            style: GoogleFonts.notoSansThai(fontSize: 15),
          ),
          // delete menu button
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.minimize),
          ),
        ),
      ),
    );
    ;
  }
}
