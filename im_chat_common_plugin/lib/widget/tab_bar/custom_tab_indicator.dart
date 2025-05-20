import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:im_chat_common_plugin/util/common_ui.dart';

// 自定义固定尺寸渐变色指示器
class CustomTabIndicator extends Decoration {
  final double width;
  final double height;
  final double radius;
  final Gradient gradient;

  CustomTabIndicator({
    double? width,
    double? height,
    double? radius,
    Gradient? gradient,
  })  : width = width ?? 22.w,
        height = width ?? 3.h,
        radius = radius ?? 2,
        gradient = gradient ?? generalLRGradient();

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _IndicatorPainter(width, height, radius, gradient);
  }
}

class _IndicatorPainter extends BoxPainter {
  final double width;
  final double height;
  final double radius;
  final Gradient gradient;

  _IndicatorPainter(this.width, this.height, this.radius, this.gradient);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Rect bounds = offset & configuration.size!;

    // 计算居中位置
    final double left = bounds.center.dx - width / 2;
    final double top = bounds.bottom - height;

    final Rect indicatorRect = Rect.fromLTWH(
      left,
      top,
      width,
      height,
    );

    final Paint paint = Paint()
      ..shader = gradient.createShader(indicatorRect)
      ..style = PaintingStyle.fill;

    canvas.drawRRect(
        RRect.fromRectAndRadius(indicatorRect, Radius.circular(radius)),
        paint
    );
  }
}
