import 'package:cafeapp/repository/menu/MenuRepository.dart';
import 'package:get/get.dart';

import '../../models/Menu.dart';

class MenuLogic extends GetxController {
  RxList<Menu> menu = <Menu>[].obs;
  var isLoading = true.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    var menu = await MenuRepository.allMenu;
    // add menu to list
    this.menu.addAll(menu);
    // set loading to false
    isLoading.value = false;
  }
}
