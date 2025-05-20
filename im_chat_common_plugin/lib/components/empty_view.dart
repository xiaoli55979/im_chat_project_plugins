import 'package:flutter/material.dart';
import 'package:im_chat_common_plugin/tools/font_utils.dart';


/// 空显示界面
class EmptyView extends StatelessWidget {
  final String text;
  final Color? color;

  const EmptyView({super.key, this.text = "暂无数据", this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.list_alt,
            color: color ?? Colors.grey,
            size: 36,
          ),
          Text(
            text,
            style: TextStyle(color: color ?? Colors.grey, fontSize: FontUtils.navFont),
          )
        ],
      ),
    );
  }
}
