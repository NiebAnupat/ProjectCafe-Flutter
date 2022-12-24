import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cafeapp/components/historyMenu.dart';
import 'detailPage.dart';

// Stateful
class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  // All orders
  List<historyMenu> history = [
    historyMenu("12-12-2565", "230"),
    historyMenu("12-12-2565", "380"),
    historyMenu("12-12-2565", "500")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            // size box
            SizedBox(
              height: 60,
            ),
            // Title
            Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.only(
                  left: 20,
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                        radius: 35,
                        backgroundImage: AssetImage('assets/images/cappu.jpg')),
                    Text(
                      "  " + "นางสาว สมชาย สมบัติ",
                      style: GoogleFonts.notoSerifThai(fontSize: 25),
                    ),
                  ],
                )),
            // List of orders
            Expanded(
              child: content(),
            ),
          ],
        ),
      ),
    );
  }

  Widget content() {
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
                    style: GoogleFonts.notoSerifThai(fontSize: 18)),
                subtitle: Text(
                  "ราคา " + keep.totalprice + " บาท",
                  style: GoogleFonts.notoSerifThai(fontSize: 15),
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
}
