import 'package:flutter/cupertino.dart';
import 'package:im_chat_common_plugin/util/fonts.dart';

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
    this.minSize = 0,
    this.spacing,
    this.padding,
    this.suffixDirectional,
    this.suffixWidget,
    this.child,
    this.onPressed,
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

  final VoidCallback? onPressed;

  /// 默认 EdgeInsets.zero
  final EdgeInsetsGeometry? padding;
  final Widget? child;

  final String? text;

  _getChild() {
    Widget childWidget = child ?? CommonText.instance(text ?? '', 16, fontWeight: CommonFontWeight.semiBold);

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: children,
        );
      }
    }

    return child;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
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
