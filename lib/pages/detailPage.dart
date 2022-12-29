import 'package:cafeapp/components/detailList.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cafeapp/components/class/Detail.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Title and back button
      appBar: AppBar(
        title: Text(
          "           รายละเอียด",
          style: GoogleFonts.notoSerifThai(fontSize: 25),
        ),
      ),
      // Content

      body: content(),
    );
  }

  Widget content() {
    // List of orders
    List<Detail> detail = [
      Detail("ลาเต้", "40", "1"),
      Detail("มอคค่า", "50", "2"),
      Detail("คาปูชิโน่", "60", "3"),
    ];

    return Padding(
      padding: const EdgeInsets.all(5),
      child: ListView.builder(
        itemCount: detail.length,
        itemBuilder: (context, i) {
          Detail food = detail[i];
          return DetailList(
              name: food.name, price: food.price, amount: food.amount);
        },
      ),
    );
    ;
  }
}
