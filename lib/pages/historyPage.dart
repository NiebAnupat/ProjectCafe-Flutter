import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cafeapp/models/History.dart';
import 'package:cafeapp/components/historyList.dart';

import '../getX/history/logic.dart';
import '../getX/user/logic.dart';

// Stateful
class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});

  final logic = Get.put(HistoryLogic());
  final userLogic = Get.put(UserLogic());

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
                child: GetX<UserLogic>(
                  builder: (userLogic) {
                    final imageURL = userLogic.imageURLString;
                    return Row(
                      children: [
                        CircleAvatar(
                            radius: 35,
                            backgroundImage: NetworkImage(imageURL)),
                        Text(
                          '\t\t\t\t${userLogic.name.value}',
                          style: GoogleFonts.notoSansThai(fontSize: 25),
                        ),
                      ],
                    );
                  },
                )),
            // List of orders
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: GetX<HistoryLogic>(
                  builder: (logic) {
                    if (logic.isLoading.value) {
                      return const GFLoader(
                        size: 100,
                      );
                    } else if (logic.history.isEmpty) {
                      return Center(
                        child: Text('ไม่มีรายการสั่งซื้อ',
                            style: GoogleFonts.notoSansThai(
                                fontSize: 25,
                                color: Colors.grey.withOpacity(0.8))),
                      );
                    } else {
                      return ListView.builder(
                          itemCount: logic.history.length,
                          itemBuilder: (context, i) {
                            historyMenu keep = logic.history[i];
                            return HistoryList(keep: keep);
                          });
                    }
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
