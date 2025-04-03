import 'package:flutter/material.dart';

/// 分割线组件
///
/// 一个通用的分割线组件，可以自定义高度、颜色、粗细以及左右的缩进。
/// 通常用于列表项之间的分割，或视图之间的分隔。
class DividerView extends StatelessWidget {
  /// 分割线的高度，默认为 `1`。
  ///
  /// 注意：`height` 定义了分割线占据的总高度，包括上下的间距。
  final double height;

  /// 分割线的颜色，默认为浅灰色 (`Color(0xFFE0E0E0)`)。
  final Color? color;

  /// 分割线的粗细，默认为 `0.5`。
  ///
  /// 这个值会影响线条的视觉厚度。
  final double? thickness;

  /// 分割线左侧的缩进，默认为 `16`。
  final double? indent;

  /// 分割线右侧的缩进，默认为 `16`。
  final double? endIndent;

  const DividerView({
    super.key,
    this.height = 1,
    this.color = const Color(0xFFE0E0E0),
    this.thickness = 0.5,
    this.indent = 16,
    this.endIndent = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      // 分割线的总高度
      height: height,

      // 分割线的颜色
      color: color,

      // 分割线的粗细
      thickness: thickness,

      // 左侧缩进
      indent: indent,

      // 右侧缩进
      endIndent: endIndent,
    );
  }
}
