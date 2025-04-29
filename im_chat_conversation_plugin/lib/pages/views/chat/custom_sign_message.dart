import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:im_chat_common_plugin/im_chat_common_plugin_library.dart';
import 'package:im_chat_common_plugin/util/asset_util.dart';
import 'package:wukongimfluttersdk/entity/msg.dart';
import 'package:im_chat_resource_plugin/generated/assets.dart';

class CustomSignMessage extends StatelessWidget {
  final types.CustomMessage message;
  final int messageWidth;

  const CustomSignMessage({
    super.key,
    required this.message,
    this.messageWidth = 296,
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

    return
      Container(
      color: CupertinoColors.systemGrey5,
      width: 220,
      child: Row(
        children: [
          Text(SlocalCommon.getLocalizaContent(SlocalCommon.of(context).read),
            style: TextStyle(color: Colors.red, fontSize: 12),
          ),
          SizedBox(width: 6,),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.lightBlue[100],
                  borderRadius:
                  BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  )
              ),
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      SizedBox(width: 10,),
                      Text(SlocalCommon.getLocalizaContent(SlocalCommon.of(context).friendsBusinessCard)),
                    ],
                  ),
                  Divider(color: Colors.blue, thickness: 1, indent: 6, endIndent: 6,),
                  Row(
                    children: [
                      SizedBox(width: 10,),
                      AssetUtil.asset(Assets.commonDefaultAvatar, fit: BoxFit.cover, width: 30),
                      SizedBox(width: 6,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("招商总局(官方)",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black54,
                            ),),
                          Text("zhaoshang", overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 10, color: Colors.black54))
                        ],
                      ),
                      SizedBox(width: 10,)
                    ],
                  ),
                  Row(
                    children: [
                      Spacer(),
                      Text("11.52", style: TextStyle(fontSize: 12, color: Colors.grey)),
                      SizedBox(width: 10,)
                    ],
                  ),
                  SizedBox(height: 10,)
                ],
              ),
            ),
          )
        ],
      ),
    );
    //   },
    // );
  }
}
