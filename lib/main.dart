// ignore_for_file: prefer_const_constructors

import 'package:cafeapp/repository/GoogleSheetProvider.dart';
import 'package:flutter/material.dart';
import 'pages/loginPage.dart';
import 'package:get/get.dart';

void main() async {
  await GoogleSheetProvider.init();
  runApp(GetMaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cafe App',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const LoginPage(),
    );
  }
}
