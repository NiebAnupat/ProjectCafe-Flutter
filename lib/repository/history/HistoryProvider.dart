import '../../models/History.dart';
import '../GoogleSheetProvider.dart';

class HistoryProvider {
  static Future fetchHistory() async {
    // fetch data from google sheet
    final orderSheet = await GoogleSheetProvider.orderSheet;
    final detailSheet = await GoogleSheetProvider.orderdetailSheet;
    var orderRows = await orderSheet.values.map.allRows();
    var detailRows = await detailSheet.values.map.allRows();
    return orderRows == null
        ? <historyMenu>[]
        : orderRows.map((e) => historyMenu.fromJSON(e, detailRows!)).toList();
  }
}
