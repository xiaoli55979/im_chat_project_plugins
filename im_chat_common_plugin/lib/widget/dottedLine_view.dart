import 'package:flutter/material.dart';

class DottedLine extends StatelessWidget {
  final Axis axis;
  final double dashWidth;
  final double dashHeight;
  final double dashSpacing;
  final Color color;

  DottedLine({
    this.axis = Axis.horizontal, // 水平或垂直
    this.dashWidth = 4.0,
    this.dashHeight = 1.0,
    this.dashSpacing = 2.0,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(double.infinity, dashHeight),
      painter: DottedLinePainter(
        axis: axis,
        dashWidth: dashWidth,
        dashHeight: dashHeight,
        dashSpacing: dashSpacing,
        color: color,
      ),
    );
  }
}

class DottedLinePainter extends CustomPainter {
  final Axis axis;
  final double dashWidth;
  final double dashHeight;
  final double dashSpacing;
  final Color color;

  DottedLinePainter({
    required this.axis,
    required this.dashWidth,
    required this.dashHeight,
    required this.dashSpacing,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;

    double startX = 0.0;
    double startY = 0.0;

    while (axis == Axis.horizontal
        ? startX < size.width
        : startY < size.height) {
      if (axis == Axis.horizontal) {
        canvas.drawRect(
          Rect.fromLTWH(startX, 0, dashWidth, dashHeight),
          paint,
        );
        startX += dashWidth + dashSpacing;
      } else {
        canvas.drawRect(
          Rect.fromLTWH(0, startY, dashHeight, dashWidth),
          paint,
        );
        startY += dashWidth + dashSpacing;
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
