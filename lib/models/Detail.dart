class Detail {
  String name;
  int price;
  int quantity;

  Detail(this.name, this.price, this.quantity);

  static Detail fromJSON(Map<String, dynamic> json) => Detail(
        json['menuName'],
        int.parse(json['unitPrice']),
        int.parse(json['qty']),
      );

  static Detail fromOrderJson(Map<String, dynamic> json) => Detail(
        json['name'],
        json['price'],
        json['quantity'],
      );
}
