import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cafeapp/components/ordersList.dart';

// Stateful
class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: content(),
      //container order button
      bottomNavigationBar: Container(
        child: Row(
          children: [
            Text("  ราคารวม " + "1000" + " บาท",
                style: GoogleFonts.notoSansThai(fontSize: 18)),
            Spacer(),

            // Order button
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.brown,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: Text("สั่งอาหาร ",
                    style: GoogleFonts.notoSansThai(fontSize: 16))),
          ],
        ),
      ),
    );
  }
}
