import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../getX/history/logic.dart';
import '../../models/Detail.dart';
import '../../models/Order.dart';
import '../GoogleSheetProvider.dart';
import 'package:cafeapp/models/History.dart';

class OrderProvider {
  static Future submitOrder(List<Order> orders) async {
    final orderSheet = await GoogleSheetProvider.orderSheet;
    final orderdetailSheet = await GoogleSheetProvider.orderdetailSheet;

    var totalPrice = 0;
    // calculate total price from orders
    orders.forEach((order) {
      totalPrice += order.price * order.quantity;
    });

    // make timestamp
    var now = DateTime.now();
    var date = '${now.year}-${now.month}-${now.day}';
    var time = '${now.hour}:${now.minute}:${now.second}';

    // get id from last row
    var lastRow = await orderSheet.values.map.allRows();
    var id = lastRow == null ? 1 : lastRow.length + 1;

    // make order data
    var orderData = {
      'id': id,
      'date': date,
      'time': time,
      'totalPrice': totalPrice,
    };

    // orderData to json
    var orderDataJson = orderData.values.map((v) => v).toList();

    print(orderDataJson);

    // insert order data
    await orderSheet.values.appendRow(orderDataJson);

    // insert order items with auto increment id and store orderID
    var orderItems = orders.map((e) => e.toJSON()).toList();
    // get last id from google sheet worksheet orderdetail
    var lastId = await orderdetailSheet.values.map.allRows();
    var orderDetailId = lastId == null ? 1 : lastId.length + 1;
    // add orderID to orderItems
    orderItems.forEach((element) {
      element['id'] = orderDetailId;
      element['orderID'] = id;
      orderDetailId++;
    });

    // to json
    var orderItemsJson = orderItems.map((e) => e.values.toList()).toList();

    // insert order items
    await orderdetailSheet.values.appendRows(orderItemsJson);

    var details =
        orders.map((e) => Detail(e.name, e.price, e.quantity)).toList();

    // return new history
    return historyMenu(date, time, totalPrice, details);
  }
}
