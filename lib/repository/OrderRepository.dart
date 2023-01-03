import 'package:cafeapp/models/Order.dart';

import 'OrderProvider.dart';

class OrderRepository {
  final OrderProvider _orderProvider = OrderProvider();

  // Future<List<Order>> fetchOrders() async {
  //   return await _orderProvider.fetchOrders();
  // }
  //
  // Future<Order> fetchOrder(int id) async {
  //   return await _orderProvider.fetchOrder(id);
  // }
  //
  // Future<Order> createOrder(Order order) async {
  //   return await _orderProvider.createOrder(order);
  // }
  //
  // Future<Order> updateOrder(Order order) async {
  //   return await _orderProvider.updateOrder(order);
  // }
  //
  // Future<Order> deleteOrder(int id) async {
  //   return await _orderProvider.deleteOrder(id);
  // }
}
