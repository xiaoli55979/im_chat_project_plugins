import 'package:flutter/material.dart';

import '../tools/font_utils.dart';

/// 主操作按钮
class MainButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool disabled;
  double? height;
  double? width;
  double? fontSize;
  Color? titleColor;
  final Color? backgroundColor;

  MainButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.backgroundColor,
    this.disabled = false,
    this.height,
    this.width,
    this.fontSize,
    this.titleColor,
  }) : super(key: key) {
    width ??= double.infinity;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height ?? 40,
      // height: 35.rl,
      child: ElevatedButton(
        onPressed: disabled ? null : onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.disabled)) {
                return backgroundColor != null ? backgroundColor?.withOpacity(0.5) : Theme.of(context).colorScheme.primary.withOpacity(0.5);
              }
              if (backgroundColor != null) {
                return backgroundColor;
              }
              return null;
            },
          ),
          padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 8.0, vertical: 0)), // 自定义内边距
        ),
        child: Text(
          text,
          style: TextStyle(
            color: titleColor ?? Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: fontSize?? FontUtils.contentFontSize,
          ),
        ),
      ),
    );
  }
}
