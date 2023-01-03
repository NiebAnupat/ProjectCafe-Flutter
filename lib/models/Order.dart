import 'package:equatable/equatable.dart';

class Order extends Equatable {
  int menuId;
  String name;
  int price;
  int quantity;

  Order(this.menuId, this.name, this.price, this.quantity);

  @override
  List<Object> get props => [menuId, name, price, quantity];
}
