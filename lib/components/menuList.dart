import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart ';

class MenuList extends StatelessWidget {
  String name;
  String price;

  MenuList({super.key, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return content();
  }

  Widget content() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(1.5),
        child: ListTile(
          title: Text(name, style: GoogleFonts.notoSansThai(fontSize: 18)),
          subtitle: Text(
            'ราคา $price บาท',
            style: GoogleFonts.notoSansThai(fontSize: 15),
          ),

          // Add menu button
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
