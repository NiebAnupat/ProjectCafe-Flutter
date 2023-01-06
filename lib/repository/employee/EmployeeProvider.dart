import '../GoogleSheetProvider.dart';
import '../../models/User.dart';

class EmployeeProvider {
  static Future login(String id, String password) async {
    // fetch data from google sheet
    final employeeSheet = await GoogleSheetProvider.employeeSheet;
    var allRows = await employeeSheet.values.map.allRows();
    if (allRows == null) {
      return null;
    }
    var user = allRows
        .map((e) => User.fromJSON(e))
        .firstWhere((e) => e.id == id && e.password == password);

    return user;
  }

  static Future FetchCurrentUserById(String id) async {
    // fetch data from google sheet
    try {
      final employeeSheet = await GoogleSheetProvider.employeeSheet;
      var allRows = await employeeSheet.values.map.allRows();
      if (allRows == null) {
        return null;
      }
      var user =
          allRows.map((e) => User.fromJSON(e)).firstWhere((e) => e.id == id);

      return user;
    } catch (e) {
      rethrow;
    }
  }
}
