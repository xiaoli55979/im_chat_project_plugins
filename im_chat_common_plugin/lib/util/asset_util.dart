import 'package:flutter/material.dart';
import 'package:im_chat_common_plugin/util/constant.dart';

class AssetUtil {
  static Image asset(String name, {double? width, double? height, BoxFit? fit, Color? color}) {
    return Image.asset(name, width: width, height: height, fit: fit, color: color, package: resourcePackageName);
  }
}