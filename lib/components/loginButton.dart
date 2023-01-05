import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cafeapp/pages/homePage.dart';
import 'package:cafeapp/pages/menuPage.dart';

import '../getX/user/logic.dart';

class LoginButton extends StatelessWidget {
  final Function()? onTap;

  LoginButton({super.key, required this.onTap});

  final userLogic = Get.put(UserLogic());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Colors.brown[400],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: GetX<UserLogic>(
            builder: (userLogic) {
              if (userLogic.isLoading.value) {
                return const CircularProgressIndicator(
                  color: Colors.white,
                );
              } else {
                return Text(
                  'เข้าสู่ระบบ',
                  style: GoogleFonts.notoSansThai(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
