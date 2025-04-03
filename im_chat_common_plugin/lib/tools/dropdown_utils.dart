import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropdownOption {
  final int index; // 索引
  final IconData icon; // 图标
  final String text; // 文本
  final String permission; // 权限字段，决定是否显示该选项

  DropdownOption({required this.index,required this.icon, required this.text, required this.permission});
}

class DropdownUtils {
  // 定义带有图标和文本的选项
  static final List<DropdownOption> allOptions = [
    DropdownOption(index: 1,icon: Icons.group_add, text: '发起群聊', permission: 'group_create'),
    DropdownOption(index: 2,icon: Icons.person_add, text: '添加好友', permission: 'friend_add'),
    DropdownOption(index: 3,icon: Icons.qr_code_scanner, text: '扫一扫', permission: 'qr_scan'),
  ];

  // 获取当前用户的权限列表
  static List<String> getUserPermissions() {
    return ['group_create', 'friend_add', "qr_scan"];
  }

  // 根据权限过滤显示的选项
  static List<DropdownOption> getFilteredOptions() {
    List<String> userPermissions = getUserPermissions();
    return allOptions.where((option) => userPermissions.contains(option.permission)).toList();
  }

  // 显示一个加号按钮，点击后弹出带有图标的下拉菜单
  static Widget buildAddButtonDropdown({
    required void Function(DropdownOption?) onChanged,
    double menuHeight = 180, // 下拉菜单的最大高度
    double menuWidth = 150, // 下拉菜单的宽度
  }) {
    List<DropdownOption> options = getFilteredOptions(); // 获取过滤后的选项

    return DropdownButton2<DropdownOption>(
      onChanged: onChanged,
      items: options
          .map((option) => DropdownMenuItem<DropdownOption>(
                value: option,
                child: Row(
                  children: [
                    Icon(option.icon, size: 20), // 图标
                    const SizedBox(width: 8), // 图标和文本之间的间距
                    Text(option.text), // 文本
                  ],
                ),
              ))
          .toList(),
      // 自定义下拉菜单样式
      dropdownStyleData: DropdownStyleData(
        maxHeight: menuHeight,
        width: menuWidth,
        padding: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        elevation: 8,
      ),
      // 自定义按钮样式（仅显示加号图标）
      buttonStyleData: ButtonStyleData(
        padding: EdgeInsets.zero, // 去掉默认的内边距
        decoration: BoxDecoration(
          shape: BoxShape.circle, // 圆形按钮
        ),
      ),
      // 自定义图标为加号
      iconStyleData: IconStyleData(
        icon: const Icon(Icons.add), // 加号图标
        iconSize: 24,
      ),
    );
  }
}
