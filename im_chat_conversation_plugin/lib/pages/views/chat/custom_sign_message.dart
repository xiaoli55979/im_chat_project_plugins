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
  final bool isOwner;

  const CustomSignMessage({
    super.key,
    required this.message,
    this.messageWidth = 296,
    required this.isOwner,
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

    return Container(
      color: CupertinoColors.systemGrey5,
      width: 220,
      child: Row(
        children: [
          Text(
            SlocalCommon.getLocalizaContent(SlocalCommon.of(context).read),
            style: TextStyle(color: Colors.red, fontSize: 12),
          ),
          SizedBox(
            width: 6,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                  color: isOwner ? Colors.blue : Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                    topRight: isOwner ? Radius.circular(0) : Radius.circular(8),
                    topLeft: isOwner ? Radius.circular(8) : Radius.circular(0),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 2, vertical: 1),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        child: Text(
                          SlocalCommon.getLocalizaContent(
                              SlocalCommon.of(context).sign),
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        )),
                  ),
                  Text(SlocalCommon.getLocalizaContent(SlocalCommon.of(context).activityLevelCheckInSynchronization,
                  ),
                    style: TextStyle(color: Colors.black, fontSize: 10),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Divider(
                    color: CupertinoColors.systemGrey2,
                    thickness: 0.5,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          style: TextStyle(color: Colors.black54, fontSize: 10),
                            "${SlocalCommon.getLocalizaContent(SlocalCommon.of(context).signSuccessContinuous)} 2"
                            " ${SlocalCommon.getLocalizaContent(SlocalCommon.of(context).accumulate)} 5"),
                      ),
                      Text("11.52",
                          style: TextStyle(fontSize: 12, color: Colors.grey)),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  )
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
