import 'dart:ui';

import 'package:flutter/cupertino.dart';

class User {
  String id;
  String password;
  String name;
  String imageURL;

  User(
      {required this.id,
      required this.password,
      required this.name,
      this.imageURL = 'https://api.multiavatar.com/Binx Bond.png'});

  static User fromJSON(Map<String, dynamic> json) => User(
        id: json['id'],
        password: json['password'],
        name: json['name'],
        imageURL: json['image'] != ""
            ? json['image']
            : "https://api.multiavatar.com/e8801d08a9808bab7e.png",
      );
}
