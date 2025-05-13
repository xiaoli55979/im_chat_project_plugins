import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../models/chat_file_entity.dart';

class ChatFileController extends GetxController {
  /// 页面状态
  int currentPage = 1;
  int pageSize = 20;
  int totalPages = 0;
  int totalRecords = 0;
  late final RefreshController refreshController = RefreshController(initialRefresh: true);
  RxBool isMultiple = false.obs;
  RxBool isChronological = false.obs; // 是否时间正序

  RxList files = [].obs;

  RxList selectedFiles = [].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    final file1 = ChatFileEntity();
    file1.sendTime = "1";
    files.value.add(file1);
    final file2 = ChatFileEntity();
    file2.sendTime = "2";
    files.value.add(file2);
    final file3 = ChatFileEntity();
    file3.sendTime = "3";
    files.value.add(file3);
    final file4 = ChatFileEntity();
    file4.sendTime = "4";
    files.value.add(file4);
  }

  void toggleFileSelection(ChatFileEntity file) {
    if (selectedFiles.value.contains(file)) {
      selectedFiles.value.remove(file);
    } else {
      selectedFiles.value.add(file);
    }
    selectedFiles.refresh();
  }

  void onRefresh() {
      loadData();
  }

  void onLoading() {

  }

  void refreshData() {

  }

  void loadData() async {
    currentPage = 1;
    if (!refreshController.isRefresh) refreshController.requestRefresh();
  }
}
