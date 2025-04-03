import 'package:flutter/cupertino.dart';
import 'package:im_chat_common_plugin/tools/tools_utils.dart';
import 'package:im_chat_resource_plugin/resource_tools.dart';

class ImageTools {
  /// 显示插件中的图片
  /// [pluginName] 是插件包的名称，例如 'my_plugin'
  /// [assetPath] 是插件内图片的路径，例如 'assets/images/sample_image.png'
  static Widget asset(String assetPath,
      {String? package, bool isCommon = false, double? width, double? height, BoxFit fit = BoxFit.contain}) {
    assetPath = ImageTools.imagePath(assetPath, isCommon: isCommon);
    return ResourceTools.asset(pluginName: package, assetPath, width: width, height: height, fit: fit);
  }

  /// 直接返回 `AssetImage`，
  static ImageProvider? getImageProvider(String assetPath, {bool isCommon = false}) {
    assetPath = ImageTools.imagePath(assetPath, isCommon: isCommon);
    return ResourceTools.getImageProvider(assetPath);
  }

  /// 返回 Image 类型图片
  static Image assetImage(String assetPath,
      {String? pluginName, bool isCommon = false, double? width, double? height, BoxFit fit = BoxFit.contain}) {
    assetPath = ImageTools.imagePath(assetPath, isCommon: isCommon);
    return ResourceTools.assetImage(pluginName: pluginName, assetPath, width: width, height: height, fit: fit);
  }

  /// 获取图片路径
  static String imagePath(String imageName, {bool isCommon = false}) {
    String inagePath = ResourceTools.imagePath(imageName, isJtp: ToolsUtils.instance.isJtp, isCommon: isCommon);
    return inagePath;
  }
}
