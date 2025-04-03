import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:im_chat_common_plugin/im_chat_common_plugin_library.dart';
import 'package:wukongimfluttersdk/entity/msg.dart';

class CustomCardMessage extends StatelessWidget {
  final types.CustomMessage message;
  final int messageWidth;

  const CustomCardMessage({
    Key? key,
    required this.message,
    this.messageWidth = 250,
  }) : super(key: key);

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

    return FutureBuilder<String>(
      future: fetchUserName(msg),
      builder: (context, snapshot) {
        final displayName = snapshot.data ?? username;

        return Container(
          width: maxDimension,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 4,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (message.author.lastName != null && message.author.lastName!.isNotEmpty)
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "${message.author.lastName}",
                      style: TextStyle(color: Colors.blueAccent, fontSize: 16),
                    ),
                  ],
                ),
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(
                      getChannelAvatarURL(msg!),
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return ImageTools.asset("default_avatar.png", isCommon: true, width: 40, height: 40);
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(child: Text(displayName, style: const TextStyle(fontSize: 15))),
                ],
              ),
              const SizedBox(height: 8),
              Divider(color: Colors.grey[300], thickness: 1),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "个人名片",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
