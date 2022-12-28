import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cafeapp/pages/detailPage.dart';
import 'package:cafeapp/components/historyMenu.dart';

class HistoryList extends StatefulWidget {
  const HistoryList({super.key});

  @override
  State<HistoryList> createState() => _HistoryListState();
}

class _HistoryListState extends State<HistoryList> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

Widget content() {
  // All orders
  List<historyMenu> history = [
    historyMenu("12-12-2565", "230"),
    historyMenu("12-12-2565", "380"),
    historyMenu("12-12-2565", "500")
  ];

  return Padding(
    padding: const EdgeInsets.all(5),
    child: ListView.builder(
      itemCount: history.length,
      itemBuilder: (context, i) {
        historyMenu keep = history[i];
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
              title: Text("วันที่ " + keep.date,
                  style: GoogleFonts.notoSansThai(fontSize: 18)),
              subtitle: Text(
                "ราคา " + keep.totalprice + " บาท",
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
      },
    ),
  );
}
