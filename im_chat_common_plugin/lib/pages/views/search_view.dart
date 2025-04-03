import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_chat_common_plugin/components/basic_view.dart';

import '../controllers/search_bar_controller.dart';

class SearchView extends GetView<SearchBarController> {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicView(
        title: "搜索",
        backGroundColor: Colors.white,
        body: GetBuilder<SearchBarController>(builder: (controller) {
          return Column(
            children: [
              // 顶部搜索框
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "请输入关键词",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                    onChanged: (value) {
                      // 可以动态更新提示内容或处理输入事件
                      controller.searchHint.value = value.isEmpty ? "搜索指定内容" : "正在搜索 \"$value\"";
                    },
                  ),
                ),
              ),
              // 提示内容
              Obx(
                () => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    controller.searchHint.value,
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ),
              ),
              // 动态按钮组
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildFilterButton(0, "全部", controller),
                    _buildFilterButton(1, "好友", controller),
                    _buildFilterButton(2, "群组", controller),
                    _buildFilterButton(3, "聊天记录", controller),
                  ],
                ),
              ),
            ],
          );
        }));
  }

  /// 构建动态按钮
  Widget _buildFilterButton(int index, String label, SearchBarController controller) {
    return GestureDetector(
      onTap: () {
        controller.selectedFilter.value = index;
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: controller.selectedFilter.value == index ? Colors.blue : Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: controller.selectedFilter.value == index ? Colors.white : Colors.black,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
