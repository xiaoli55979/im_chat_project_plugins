import 'package:flutter/material.dart';

import '../tools/font_utils.dart';

/// 主操作按钮
class TitleText extends Text {
  TitleText(
    super.data, {
    super.key,
    TextStyle? style,
    bool? softWrap,
    int? maxLines,
    TextOverflow? overflow,
  }) : super(
          style: style ?? TextStyle(fontSize: FontUtils.contentTitleFontSize), // Set your default font size here
        );
}
