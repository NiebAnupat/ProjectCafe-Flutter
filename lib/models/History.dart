import 'package:intl/intl.dart';
import 'Detail.dart';

class historyMenu {
  String date;
  String time;
  int totalprice;
  List<Detail> detail;

  historyMenu(this.date, this.time, this.totalprice, this.detail);

  static historyMenu fromJSON(
      Map<String, dynamic> json, List<Map<String, dynamic>> detailRows) {
    List<Detail> detail = [];

    for (var i = 0; i < detailRows.length; i++) {
      if (json['id'] == detailRows[i]['orderID']) {
        detail.add(Detail.fromJSON(detailRows[i]));
      }
    }

    // json['date'] is 44931 (days since 1900-01-01) and json['time'] is 0.07875 (fraction of day)
    // so we need to convert it to DateTime
    var date = DateTime.fromMillisecondsSinceEpoch(
        (int.parse(json['date']) - 25569) * 86400000,
        isUtc: true);
    var time = DateTime.fromMillisecondsSinceEpoch(
        ((double.parse(json['time']) - 25569) * 86400000).round(),
        isUtc: true);

    // format date and time
    var dateFormat = DateFormat('dd/MM/yyyy');
    var timeFormat = DateFormat('HH:mm');

    return historyMenu(
      dateFormat.format(date),
      timeFormat.format(time),
      int.parse(json['totalPrice']),
      detail,
    );
  }
}
