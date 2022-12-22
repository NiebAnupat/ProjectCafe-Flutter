// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'loginPage.dart';
import 'menuPage.dart';

void main() {
  runApp(const MyApp());
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
      home: const MenuPage(),
    );
  }
}
