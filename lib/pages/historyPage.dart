import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cafeapp/components/class/History.dart';
import 'package:cafeapp/components/historyList.dart';

// Stateful
class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  //History List
  List<historyMenu> _history = [
    historyMenu("2021-09-01", 500),
    historyMenu("2021-09-02", 200),
    historyMenu("2021-09-03", 300),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            // size box
            const SizedBox(
              height: 60,
            ),
            // Title
            Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.only(
                  left: 20,
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                        radius: 35,
                        backgroundImage: AssetImage('assets/images/cappu.jpg')),
                    Text(
                      "  " + "นางสาว สมชาย สมบัติ",
                      style: GoogleFonts.notoSansThai(fontSize: 25),
                    ),
                  ],
                )),
            // List of orders
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: ListView.builder(
                  itemCount: _history.length,
                  itemBuilder: (context, i) {
                    historyMenu keep = _history[i];
                    return HistoryList(
                        date: keep.date, totalprice: keep.totalprice);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
