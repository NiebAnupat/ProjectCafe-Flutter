import '../../models/History.dart';
import 'HistoryProvider.dart';

class HistoryRespository {
  static Future<List<historyMenu>> get history async =>
      await HistoryProvider.fetchHistory();
}
