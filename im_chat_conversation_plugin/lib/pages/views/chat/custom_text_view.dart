import 'dart:convert';
// import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:im_chat_common_plugin/im_chat_common_plugin_library.dart';
import 'package:wukongimfluttersdk/entity/msg.dart';

class CustomTextView extends StatelessWidget {
  final types.TextMessage message;
  final int messageWidth;
  final bool isOwner;
  final void Function(BuildContext context, types.Message)? onMessageStatusTap;
  const CustomTextView({
    super.key,
    required this.message,
    this.messageWidth = 250, required this.isOwner, this.onMessageStatusTap,
  });

  Future<String> fetchUserName(WKMsg? msg) async {
    if (msg == null) return "未知用户";

    try {
      // 解析 JSON
      final Map<String, dynamic> contentMap = json.decode(msg.content);
      return contentMap["name"] ?? "未知用户";
    } catch (e) {
      print("解析 msg.content 出错: $e");
      return "未知用户";
    }
  }

  static String getChannelAvatarURL(WKMsg msg) {
    try {
      final Map<String, dynamic> contentMap = json.decode(msg.content);
      String uid = contentMap["uid"] ?? "";
      return "${HttpUtils.getBaseUrl()}/${HttpUtils.getAvatarUrl(uid)}";
    } catch (e) {
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    final metadata = message.metadata ?? {};
    final WKMsg? msg = metadata['wkMsg'] as WKMsg?;
    final String username = metadata['username'] as String? ?? "用户名";

    final double maxDimension = messageWidth.toDouble();

    // return
    // FutureBuilder<String>(
    // future: fetchUserName(msg),
    // builder: (context, snapshot) {
    //   final displayName = snapshot.data ?? username;

    return GestureDetector(
      onTap: () {
        onMessageStatusTap?.call(context, message);
      },
      child: Container(
        color: CupertinoColors.systemGrey5,
        width: maxDimension,
        child: Row(
          children: [
            Text(SlocalCommon.getLocalizaContent(SlocalCommon.of(context).read),
              style: TextStyle(color: Colors.red, fontSize: 12),
            ),
            SizedBox(width: 6,),
            Expanded(
              child: Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: isOwner ? Radius.circular(0) : Radius.circular(8),
                      topLeft: isOwner ? Radius.circular(8) : Radius.circular(0),
                      bottomRight: Radius.circular(8),
                      bottomLeft: Radius.circular(8)
                    )
                  ),
                  width: messageWidth.toDouble(),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end, // 垂直对齐到底部
                    children: [
                      Expanded(
                        child: Text(
                          message.text,
                          maxLines: 10,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(),
                        ),
                      ),
                      SizedBox(width: 8), // 添加间距
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end, // 垂直对齐到底部
                        crossAxisAlignment: CrossAxisAlignment.end, // 水平对齐到右侧
                        children: [
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              "21.04",
                              style: TextStyle(color: Colors.grey, fontSize: 10),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
              ),
            )
          ],
        ),
      ),
    );
    //   },
    // );
  }
}
