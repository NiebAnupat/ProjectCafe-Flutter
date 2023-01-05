import 'EmployeeProvider.dart';

class EmployeeRepository {
  static Future login(String id, String password) async {
    return await EmployeeProvider.login(id, password);
  }

  static Future FetchCurrentUserById(String id) async {
    return await EmployeeProvider.FetchCurrentUserById(id);
  }
}
