import 'package:cafeapp/components/detailList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cafeapp/models/Detail.dart';

import '../getX/history/logic.dart';

class DetailPage extends StatelessWidget {
  List<Detail> detail;

  DetailPage({required this.detail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Title and back button
      appBar: AppBar(
        title: Text(
          "รายละเอียด",
          style: GoogleFonts.notoSansThai(fontSize: 25),
        ),
      ),
      // Content
      body: Padding(
          padding: const EdgeInsets.all(5),
          child: ListView.builder(
            itemCount: detail.length,
            itemBuilder: (context, i) {
              Detail food = detail[i];
              return DetailList(
                  name: food.name, price: food.price, amount: food.quantity);
            },
          )),
    );
  }
}
