import 'package:get/get.dart';

import '../../models/Detail.dart';
import '../../models/History.dart';
import '../../repository/history/HistoryRepository.dart';

class HistoryLogic extends GetxController {
  var history = [].obs;
  var isLoading = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    var fetch = await HistoryRespository.history;
    history.addAll(fetch);
  }

  void addHistory(historyMenu newHistory) {
    history.add(newHistory);
  }

  void fetchHistory() async {
    isLoading(true);
    history.clear();
    var fetch = await HistoryRespository.history;
    history.addAll(fetch);
    isLoading(false);
  }
}
