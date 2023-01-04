import 'package:get/get.dart';

import '../../models/Menu.dart';

class MenuLogic extends GetxController {
  RxList<Menu> menu = [
    Menu(1, "ลาเต้", 40),
    Menu(2, "มอคค่า", 50),
    Menu(3, "คาปูชิโน่", 60),
    Menu(4, "ทดสอบ", 70),
  ].obs;
}
