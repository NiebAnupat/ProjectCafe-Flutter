import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cafeapp/pages/detailPage.dart';

class HistoryList extends StatelessWidget {
  String date;
  int totalprice;

  HistoryList({super.key, required this.date, required this.totalprice});

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
          title: Text("วันที่ $date",
              style: GoogleFonts.notoSansThai(fontSize: 18)),
          subtitle: Text(
            "ราคา $totalprice บาท",
            style: GoogleFonts.notoSansThai(fontSize: 15),
          ),

          // Button
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailPage()),
          ),
        ),
      ),
    );
  }
}
