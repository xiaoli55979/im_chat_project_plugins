import 'package:flutter/material.dart';

import '../tools/font_utils.dart';

/// 主操作按钮
class NavText extends Text {
  NavText(super.data, {super.key, TextStyle? style})
      : super(
          style: style ?? TextStyle(fontSize: FontUtils.navFont), // Set your default font size here
        );
}
