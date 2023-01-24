import 'dart:ui';
import 'dart:convert';

import 'package:cafeapp/repository/employee/EmployeeRepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../pages/homePage.dart';

class UserLogic extends GetxController {
  var name = "".obs;
  var imageURL = "".obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadUser();
  }

  Future saveUser(String id, String name, String image) async {
    isLoading.value = true;
    this.name.value = name;
    imageURL.value = image;

    // save to local storage by shared_preferences
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('id', id);
    prefs.setString('name', name);
    prefs.setString('imageURL', image);
    isLoading.value = false;
  }

  Future loadUser() async {
    // load from local storage by shared_preferences
    try {
      isLoading.value = true;
      final prefs = await SharedPreferences.getInstance();
      final id = prefs.getString('id');
      final user = await EmployeeRepository.FetchCurrentUserById(id!);
      if (user.name != '') {
        name.value = user.name;
        imageURL.value = user.imageURL;
        Get.offAll(() => const HomePage());
      }
    } catch (e) {
      // TODO
      logout();
    } finally {
      isLoading.value = false;
    }
  }

  Future logout() async {
    isLoading.value = true;
    // clear local storage by shared_preferences
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('id');
    prefs.remove('name');
    prefs.remove('imageURL');
    name.value = "";
    imageURL.value = "";
    isLoading.value = false;
  }

  String get imageURLString =>
      imageURL.value ?? "https://api.multiavatar.com/e8801d08a9808bab7e.png";
}
