import 'package:cafeapp/repository/GoogleSheetProvider.dart';

import '../../models/Menu.dart';

class MenuProvider {
  static Future fetchMenu() async {
    // fetch data from google sheet
    final menuSheet = await GoogleSheetProvider.menuSheet;
    var allRows = await menuSheet.values.map.allRows();
    return allRows == null
        ? <Menu>[]
        : allRows.map((e) => Menu.fromJSON(e)).toList();
  }
}
