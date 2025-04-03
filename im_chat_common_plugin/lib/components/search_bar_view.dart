import 'package:flutter/material.dart';
import 'package:get/get.dart'; // 如果使用 GetX 导航

class SearchBarView extends StatelessWidget {
  final VoidCallback? onTap; // 点击回调函数
  final String hintText; // 提示文本
  final Color backgroundColor; // 背景颜色
  final Color iconColor; // 图标颜色
  final Color textColor; // 文本颜色

  const SearchBarView({
    Key? key,
    this.onTap,
    this.hintText = "搜索",
    this.backgroundColor = Colors.grey,
    this.iconColor = Colors.grey,
    this.textColor = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: InkWell(
        onTap: onTap ??
            () {
              Get.toNamed('/search'); // 默认跳转到搜索页面
            },
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: backgroundColor.withOpacity(0.2), // 背景颜色
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(Icons.search, color: iconColor), // 搜索图标
              const SizedBox(width: 8),
              Text(
                hintText,
                style: TextStyle(
                  color: textColor,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
