import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:im_chat_resource_plugin/resource/common_embeds.dart';
import 'package:im_chat_resource_plugin/resource/ichat_embeds.dart';

class ResourceTools {
  /// 插件名称
  static String pluginName() {
    return "im_chat_resource_plugin";
  }

  /// 显示插件中的图片
  /// [pluginName] 是插件包的名称，例如 'my_plugin'
  /// [assetPath] 是插件内图片的路径，例如 'assets/images/sample_image.png'
  static Widget asset(String assetPath, {String? pluginName, double? width, double? height, BoxFit fit = BoxFit.cover}) {
    try {
      var imageBytes = getResourceByName(assetPath);
      if (imageBytes == null) {
        return const Text('Error: Image not found', style: TextStyle(color: Colors.red));
      }
      return Image.memory(
        imageBytes,
        fit: fit,
        height: height,
        width: width,
        gaplessPlayback: true,
      );
    } catch (e) {
      return Text(
        'Error_image: $e',
        style: TextStyle(color: Colors.red),
      );
    }
  }

  /// 返回一个asset image
  static Image assetImage(
    String assetPath, {
    String? pluginName,
    double? width,
    double? height,
    BoxFit fit = BoxFit.cover,
  }) {
    try {
      // 获取资源的字节数据
      var imageBytes = getResourceByName(assetPath);

      // 如果图片数据为空，则返回一个默认的占位图
      if (imageBytes == null) {
        return Image.asset(
          package: ResourceTools.pluginName(),
          'assets/images/default_placeholder.png', // 默认占位图路径
          width: width ?? double.infinity,
          height: height ?? double.infinity,
          fit: fit,
        );
      }

      // 如果获取到图片数据，返回 Image.memory
      return Image.memory(
        imageBytes,
        fit: fit,
        width: width ?? double.infinity,
        height: height ?? double.infinity,
        gaplessPlayback: true,
      );
    } catch (e) {
      // 捕获异常并返回占位图
      // debugPrint('Error loading image: $e');
      return Image.asset(
        package: ResourceTools.pluginName(),
        'assets/images/placeholder.png', // 默认占位图路径
        width: width ?? double.infinity,
        height: height ?? double.infinity,
        fit: fit,
        gaplessPlayback: true,
      );
    }
  }

  /// 获取图片路径
  static String imagePath(String imageName, {required bool isJtp, bool isCommon = false}) {
    String fullPath = "";
    if (imageName.startsWith("common/") || imageName.startsWith("ichat/")) return imageName;
    if (isCommon) {
      fullPath = "common/$imageName";
    } else {
      fullPath = "ichat/$imageName";
    }
    // debugPrint("fullPath_image:$fullPath");
    return fullPath;
  }

  static Uint8List? getResourceByName(
    String assetPath,
  ) {
    var imageBytes = null;
    if (assetPath.startsWith("common")) {
      imageBytes = EmbeddedCommon.getResourceByName(assetPath);
    } else if (assetPath.startsWith("ichat")) {
      imageBytes = EmbeddedIchat.getResourceByName(assetPath);
    }
    return imageBytes;
  }

  // Updated getResourceByName to return an ImageProvider
  static ImageProvider? getImageProvider(String assetPath) {
    Uint8List? imageBytes = getResourceByName(assetPath);
    // Return the image as an ImageProvider
    if (imageBytes != null) {
      return MemoryImage(imageBytes);
    } else if (assetPath.startsWith("ichat")) {
      imageBytes = EmbeddedIchat.getResourceByName(assetPath);
    }
    return null; // Return null if no image found
  }
}
