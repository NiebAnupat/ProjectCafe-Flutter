import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cafeapp/models/Detail.dart';

class DetailList extends StatelessWidget {
  String name;
  int price;
  int amount;

  DetailList(
      {super.key,
      required this.name,
      required this.price,
      required this.amount});

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
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(1.5),
        child: ListTile(
          title: Text(name, style: GoogleFonts.notoSansThai(fontSize: 18)),
          subtitle: Text(
            "ราคา $price บาท" +
                " จำนวน $amount" +
                " => รวม ${price * amount} บาท",
            style: GoogleFonts.notoSansThai(fontSize: 15),
          ),
        ),
      ),
    );
    ;
  }
}
