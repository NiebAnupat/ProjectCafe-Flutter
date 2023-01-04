import 'package:cafeapp/models/Order.dart';

import 'OrderProvider.dart';

class OrderRepository {
  static Future createOrder(List<Order> orders) async {
    await OrderProvider.submitOrder(orders);
  }
}
