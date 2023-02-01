import '../repository/menu/MenuFields.dart';

class Menu {
  int id;
  String name;
  int price;
  String image;

  Menu(this.id, this.name, this.price, this.image);

  static Menu fromJSON(Map<String, dynamic> json) => Menu(
        int.parse(json[MenuFields.id]),
        json[MenuFields.name],
        int.parse(json[MenuFields.price]),
        json[MenuFields.image],
      );

  Map<String, dynamic> toJSON() => {
        MenuFields.id: id,
        MenuFields.name: name,
        MenuFields.price: price,
        MenuFields.image: image,
      };
}
