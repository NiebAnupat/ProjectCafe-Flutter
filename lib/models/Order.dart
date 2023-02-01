import 'package:cafeapp/models/Detail.dart';

class Order {
  int menuId;
  String name;
  int price;
  int quantity;
  String image;

  Order(this.menuId, this.name, this.price, this.quantity, this.image);

  Map<String, dynamic> toJSON() => {
        'id': 0,
        'menuName': name,
        'qty': quantity,
        'unitPrice': price,
        'subTotal': price * quantity,
        'orderID': 0,
      };

  static Detail fromJSON(Map<String, dynamic> json) => Detail(
        json['menuName'],
        int.parse(json['unitPrice']),
        int.parse(json['qty']),
      );
}
