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

  int totalPrice() {
    int total = 0;
    for (int i = 0; i < detail.length; i++) {
      total += detail[i].price * detail[i].quantity;
    }
    return total;
  }

  int allAmount() {
    int total = 0;
    for (int i = 0; i < detail.length; i++) {
      total += detail[i].quantity;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Title and back button
      appBar: AppBar(
        title: Text(
          "รายละเอียด",
          style: GoogleFonts.notoSansThai(fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.brown,
      ),
      // Content
      body: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: detail.length,
                  itemBuilder: (context, i) {
                    Detail food = detail[i];
                    return DetailList(
                      name: food.name,
                      price: food.price,
                      amount: food.quantity,
                    );
                  },
                ),
              ),
              Text("จำนวน ${allAmount()} รายการ",
                  style: GoogleFonts.notoSansThai(fontSize: 17)),
              Text("ราคารวม ${totalPrice()} บาท",
                  style: GoogleFonts.notoSansThai(fontSize: 17)),
            ],
          )),
    );
  }
}
