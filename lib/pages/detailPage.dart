import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cafeapp/components/menuCafe.dart';

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
    List<menuCafe> menu = [
      menuCafe("ลาเต้", "40"),
      menuCafe("มอคค่า", "50"),
      menuCafe("คาปูชิโน่", "60"),
    ];

    return Padding(
      padding: const EdgeInsets.all(5),
      child: ListView.builder(
        itemCount: menu.length,
        itemBuilder: (context, i) {
          menuCafe food = menu[i];
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
                title: Text(food.name,
                    style: GoogleFonts.notoSerifThai(fontSize: 18)),
                subtitle: Text(
                  "ราคา " + food.price + " บาท" + " จำนวน ",
                  style: GoogleFonts.notoSerifThai(fontSize: 15),
                ),
              ),
            ),
          );
        },
      ),
    );
    ;
  }
}
