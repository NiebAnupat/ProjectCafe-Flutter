import '../../models/Menu.dart';
import 'MenuProvider.dart';

class MenuRepository {
  static Future<List<Menu>> get allMenu async => await MenuProvider.fetchMenu();
}
