import 'dart:io';

import 'package:flutter/material.dart';
import 'package:im_chat_common_plugin/util/constant.dart';
import 'package:im_chat_resource_plugin/generated/assets.dart';

class AssetUtil {
  static Image asset(String name, {double? width, double? height, BoxFit? fit, Color? color}) {
    return Image.asset(name, width: width, height: height, fit: fit, color: color, package: resourcePackageName);
  }

  static Image file(File file, {double? width, double? height, BoxFit? fit, Color? color, ImageErrorWidgetBuilder? errorBuilder}) {
    return Image.file(file, width: width, height: height, fit: fit ?? BoxFit.cover, color: color, errorBuilder: errorBuilder ?? (context, object,stack){
      return asset(Assets.commonPlaceholder, width: width, height: height, fit: fit, color: color);
    });
  }
}