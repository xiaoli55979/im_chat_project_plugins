import 'package:get/get.dart';
import 'package:im_chat_common_plugin/api/provider.dart';

class SearchBarController extends GetxController {
  SearchBarController({required this.api});
  final ApiProvider api;

  // 搜索结果
  var searchResults = [].obs;

  // 搜索关键字
  var searchQuery = ''.obs;

  // 当前选中的过滤器索引（0: 全部, 1: 好友, 2: 群组, 3: 聊天记录）
  var selectedFilter = 0.obs;

  var searchHint = "".obs;
  @override
  void onReady() {
    super.onReady();
    // 可以在这里调用初始加载逻辑，例如加载默认搜索结果
    loadInitialData();
  }

  /// 加载初始数据
  void loadInitialData() async {
    try {
      // final results = await api.fetchDefaultSearchResults();
      // searchResults.assignAll(results); // 将结果存储到 searchResults
    } catch (e) {
      print("加载初始数据失败：$e");
    }
  }

  /// 搜索内容
  Future<void> search(String query) async {
    searchQuery.value = query; // 更新搜索关键字
    try {
      // final results = await api.search(query, selectedFilter.value); // 调用 API 进行搜索
      // searchResults.assignAll(results); // 更新搜索结果
    } catch (e) {
      print("搜索失败：$e");
    }
  }

  /// 切换过滤器
  void changeFilter(int index) {
    selectedFilter.value = index; // 更新当前选中的过滤器
    // 根据新的过滤器重新触发搜索
    if (searchQuery.isNotEmpty) {
      search(searchQuery.value);
    }
  }
}
