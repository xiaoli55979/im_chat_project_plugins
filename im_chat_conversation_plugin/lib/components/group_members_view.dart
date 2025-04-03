import 'package:flutter/material.dart';

class GroupMembersView extends StatelessWidget {
  final int currentCount;
  final int totalCount;
  final List<String> avatars; // 头像列表
  final VoidCallback onArrowTap;
  final VoidCallback onAddTap;

  const GroupMembersView({
    Key? key,
    required this.currentCount,
    required this.totalCount,
    required this.avatars,
    required this.onArrowTap,
    required this.onAddTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white, // 背景色
        borderRadius: BorderRadius.circular(10), // 圆角
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            spreadRadius: 1,
            offset: const Offset(0, 2),
          ),
        ],
        border: const Border(
          bottom: BorderSide(color: Colors.grey, width: 0.5), // 底部下划线
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 标题 + 箭头
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '全部群成员 ($currentCount/$totalCount)',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: onArrowTap,
                child: const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // 头像列表 + 固定的添加按钮
          Row(
            children: [
              // 头像列表（可滚动）
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: avatars.map((avatar) {
                      return Container(
                        width: 45,
                        height: 45,
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(avatar),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              // 添加按钮（固定）
              GestureDetector(
                onTap: onAddTap,
                child: Container(
                  width: 45,
                  height: 45,
                  margin: const EdgeInsets.only(left: 8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[300],
                  ),
                  child: const Icon(Icons.add, size: 28, color: Colors.black),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
