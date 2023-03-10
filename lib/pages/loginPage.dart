import 'package:cafeapp/components/loginButton.dart';
import 'package:cafeapp/repository/employee/EmployeeRepository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../getX/user/logic.dart';
import 'homePage.dart';

class LoginPage extends StatelessWidget {
  final userLogic = Get.put(UserLogic());
  @override
  Widget build(BuildContext context) {
    final idController = TextEditingController();
    final passwordController = TextEditingController();

    loginUser() async {
      try {
        userLogic.isLoading.value = true;
        final user = await EmployeeRepository.login(
            idController.text, passwordController.text);
        await userLogic.saveUser(user.id, user.name, user.imageURL);
        userLogic.isLoading.value = false;
        Get.offAll(const HomePage());
      } catch (e) {
        Get.snackbar(
          'เข้าสู่ระบบไม่สำเร็จ',
          'กรุณาตรวจสอบรหัสพนักงานและรหัสผ่าน',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          titleText: Text(
            'เข้าสู่ระบบไม่สำเร็จ',
            style: GoogleFonts.notoSansThai(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          messageText: Text(
            'กรุณาตรวจสอบรหัสพนักงานและรหัสผ่าน',
            style: GoogleFonts.notoSansThai(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          margin: const EdgeInsets.all(20),
        );
      }
    }

    return Scaffold(
        backgroundColor: Colors.brown[200],
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Ruen Darunee`s Cafe",
                    style: GoogleFonts.playfairDisplay(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // Logo
                  Container(
                    width: 200,
                    height: 200,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/logo.png"),
                        scale: 4,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),

                  //ID input
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          controller: idController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "รหัสพนักงาน",
                              hintStyle: GoogleFonts.notoSansThai()),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Password input
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: TextField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "รหัสผ่าน",
                                hintStyle: GoogleFonts.notoSansThai()),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Login button
                  LoginButton(onTap: loginUser),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
        ));
  }
}
