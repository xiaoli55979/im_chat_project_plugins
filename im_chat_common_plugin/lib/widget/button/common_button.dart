import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:im_chat_common_plugin/config/color/colors.dart';
import 'package:im_chat_common_plugin/util/common_ui.dart';
import 'package:im_chat_common_plugin/util/fonts.dart';

///按钮样式
enum CommonButtonStyle {
  text,
  custom,
}

/// 图标位置
enum SuffixDirectional {
  top,
  bottom,
  left,
  right,
}

class CommonButton extends StatelessWidget {
  const CommonButton({
    super.key,
    this.text,
    this.color,
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    this.disabledColor = CupertinoColors.quaternarySystemFill,
    this.minSize = 45,
    this.spacing,
    this.padding,
    this.suffixDirectional,
    this.suffixWidget,
    this.commonButtonStyle = CommonButtonStyle.custom,
    this.child,
    this.onPressed,
    this.enable = true,
    this.width,
    this.height,
    this.gradient,
    this.decoration,
  });

  const CommonButton.text({
    super.key,
    this.text,
    this.color,
    this.disabledColor = CupertinoColors.quaternarySystemFill,
    this.borderRadius = BorderRadius.zero,
    this.minSize = 0,
    this.spacing,
    this.suffixDirectional,
    this.suffixWidget,
    this.commonButtonStyle = CommonButtonStyle.text,
    this.onPressed,
    this.padding,
    this.child,
    this.enable = true,
    this.width,
    this.height,
    this.gradient,
    this.decoration,
  });

  /// 按钮背景颜色
  final Color? color;

  /// 不可点击时颜色
  final Color disabledColor;

  final BorderRadius? borderRadius;

  /// 最小尺寸
  final double? minSize;

  /// 图文间距，默认 4
  final double? spacing;

  /// icon方向，默认文字右侧
  final SuffixDirectional? suffixDirectional;
  final Widget? suffixWidget;

  final CommonButtonStyle? commonButtonStyle;

  final VoidCallback? onPressed;

  /// 默认 EdgeInsets.zero
  final EdgeInsetsGeometry? padding;
  final Widget? child;

  final String? text;

  final double? height;
  final double? width;
  final Gradient? gradient;
  final Decoration? decoration;
  final bool enable;

  _getChild() {
    Widget childWidget = child ?? CommonText.instance(text ?? '', 16.sp, color: IMColors.white, fontWeight: CommonFontWeight.medium);

    if (suffixWidget != null) {
      if (suffixDirectional == SuffixDirectional.bottom || suffixDirectional == SuffixDirectional.top) {
        Widget spacWidget = SizedBox(height: spacing ?? 6);
        List<Widget> children = [suffixWidget!, spacWidget, childWidget];

        if (suffixDirectional == SuffixDirectional.bottom) {
          children = [childWidget, spacWidget, suffixWidget!];
        }

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: children,
        );
      } else {
        Widget spacWidget = SizedBox(width: spacing ?? 6);
        List<Widget> children = [childWidget, spacWidget, suffixWidget!];

        if (suffixDirectional == SuffixDirectional.left) {
          children = [suffixWidget!, spacWidget, childWidget];
        }

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: children,
        );
      }
    }

    return childWidget;
  }

  @override
  Widget build(BuildContext context) {
    final buttonHeight = height ?? 48.h;
    return commonButtonStyle == CommonButtonStyle.text
        ? CupertinoButton(
            borderRadius: borderRadius,
            minSize: minSize,
            padding: padding ?? EdgeInsets.zero,
            onPressed: onPressed,
            child: Opacity(
              opacity: enable ? 1.0 : 0.3,
              child: Container(
                height: buttonHeight,
                width: width,
                alignment: Alignment.center,
                decoration: decoration ?? BoxDecoration(
                  borderRadius: BorderRadius.circular(buttonHeight / 2),
                  gradient: gradient ?? generalLRGradient(),
                ),
                child: _getChild(),
              ),
            ),
          )
        : CupertinoButton(
            color: color,
            disabledColor: disabledColor,
            borderRadius: borderRadius,
            minSize: minSize,
            padding: padding ?? EdgeInsets.zero,
            child: _getChild(),
            onPressed: onPressed,
          );
  }
}
