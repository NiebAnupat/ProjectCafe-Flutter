import 'package:get/get.dart';

import '../../models/Order.dart';

class OrderLogic extends GetxController {
  var orders = [].obs;
  var total = 0.obs;

  addOrder(Order order) {
    // check if the order is already in the list by id
    if (orders.any((element) => element.menuId == order.menuId)) {
      // if it is, increase the quantity
      orders[orders.indexWhere((element) => element.menuId == order.menuId)]
          ?.quantity += 1;

      // update the total
      total.value += order.price;
    } else {
      // if it isn't, add the order to the list
      orders.add(order);

      // update the total
      total.value += order.price;
    }
  }

  deleteOrder(Order order) {
    int index = orders.indexWhere((element) => element.menuId == order.menuId);
    // decrease the quantity by id
    var newOrder = Order(0, '', 0, 0);
    newOrder.menuId = orders[index].menuId;
    newOrder.name = orders[index].name;
    newOrder.price = orders[index].price;
    newOrder.quantity = orders[index].quantity - 1;
    orders[index] = newOrder;
    // if the quantity is 0, remove the order from the list
    if (orders[index]?.quantity == 0) {
      orders.removeAt(index);
    }

    // update the total
    total.value -= order.price;
  }
}
