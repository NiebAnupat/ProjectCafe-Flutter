import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cafeapp/pages/detailPage.dart';

import '../models/History.dart';

class HistoryList extends StatelessWidget {
  historyMenu keep;

  HistoryList({super.key, required this.keep});

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
          title: Text("วันที่ ${keep.date} | ${keep.time} น.",
              style: GoogleFonts.notoSansThai(fontSize: 18)),
          subtitle: Text(
            "ราคารวม ${keep.totalprice} บาท",
            style: GoogleFonts.notoSansThai(fontSize: 15),
          ),

          // Button
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPage(detail: keep.detail)),
          ),
        ),
      ),
    );
  }
}
