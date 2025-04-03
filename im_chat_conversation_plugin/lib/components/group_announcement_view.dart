import 'package:flutter/material.dart';
import 'package:im_chat_common_plugin/components/divider_view.dart';
import 'package:im_chat_common_plugin/tools/font_utils.dart';

class GroupAnnouncementView extends StatelessWidget {
  final String announcement;

  const GroupAnnouncementView({super.key, required this.announcement});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 15, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 左边的标题
                Text(
                  "群公告",
                  style: TextStyle(
                    fontSize: FontUtils.contentTitleFontSize,
                  ),
                ),
                // 右边的公告内容，允许换行
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      announcement,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                      maxLines: 5, // 限制最多显示5行
                      overflow: TextOverflow.ellipsis, // 超出部分显示省略号
                      softWrap: true, // 启用换行
                    ),
                  ),
                ),
              ],
            ),
          ),
          DividerView(),
        ],
      ),
    );
  }
}
