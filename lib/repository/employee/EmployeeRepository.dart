import 'EmployeeProvider.dart';

class EmployeeRepository {
  static Future login(String id, String password) async {
    try {
      return await EmployeeProvider.login(id, password);
    } catch (e, s) {
      rethrow;
    }
  }

  static Future FetchCurrentUserById(String id) async {
    try {
      return await EmployeeProvider.FetchCurrentUserById(id);
    } catch (e) {
      rethrow;
    }
  }
}
