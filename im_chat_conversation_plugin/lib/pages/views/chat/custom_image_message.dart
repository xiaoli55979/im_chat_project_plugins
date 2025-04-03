import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class CustomImageMessage extends StatelessWidget {
  final types.ImageMessage message;
  final int messageWidth;
  const CustomImageMessage({
    Key? key,
    required this.message,
    this.messageWidth = 250,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 最大宽度和高度
    final double maxDimension = messageWidth.toDouble();

    // 获取原始宽高
    final double originalWidth = message.width?.toDouble() ?? 200;
    final double originalHeight = message.height?.toDouble() ?? 200;

    // 计算缩放后的宽高，确保不超过最大限制
    double scaledWidth, scaledHeight;
    if (originalWidth > originalHeight) {
      scaledWidth = maxDimension;
      scaledHeight = (originalHeight / originalWidth) * maxDimension;
    } else {
      scaledHeight = maxDimension;
      scaledWidth = (originalWidth / originalHeight) * maxDimension;
    }

    // 判断 URI 是否为本地路径
    final bool isLocal = Uri.tryParse(message.uri)?.scheme.isEmpty ?? false;

    return Container(
      width: scaledWidth,
      // margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(2),
        color: Colors.grey[200],
      ),
      child: ClipRRect(
        // borderRadius: BorderRadius.circular(2),
        child: Stack(
          children: [
            isLocal
                ? Image.file(
                    File(message.uri),
                    width: scaledWidth,
                    height: scaledHeight,
                    fit: BoxFit.contain,
                  )
                : CachedNetworkImage(
                    imageUrl: message.uri,
                    width: scaledWidth,
                    height: scaledHeight,
                    fit: BoxFit.contain,
                    placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
          ],
        ),
      ),
    );
  }
}
