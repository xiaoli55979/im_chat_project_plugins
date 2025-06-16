import 'package:flutter/material.dart';

class TrianglePainter extends CustomPainter {
  final bool? isPointingDown;
  final Color? color;
  TrianglePainter({
    this.isPointingDown = true,
    this.color = const Color(0xffDDE2FF),
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color!
      ..style = PaintingStyle.fill;

    final path = Path();
    if (isPointingDown!) {
      path.moveTo(0, 0);
      path.lineTo(size.width / 2, size.height);
      path.lineTo(size.width, 0);
    } else {
      path.moveTo(0, size.height);
      path.lineTo(size.width / 2, 0);
      path.lineTo(size.width, size.height);
    }
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}