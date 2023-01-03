import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'logic.dart';

class OrderPage extends StatelessWidget {
  final logic = Get.put(OrderLogic());
  final state = Get.find<OrderLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
