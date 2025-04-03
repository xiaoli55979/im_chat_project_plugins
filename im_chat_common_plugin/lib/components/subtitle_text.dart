import 'package:flutter/material.dart';

import '../tools/font_utils.dart';

/// 主操作按钮
class SubtitleText extends Text {
  SubtitleText(
    String data, {
    Key? key,
    TextStyle? style,
  }) : super(
          data,
          key: key,
          style: style ?? TextStyle(fontSize: FontUtils.contentSubFontSize),
        );
}
