import 'package:flutter/material.dart';

class DashedLineView extends StatelessWidget {
  final double height;
  final double dashWidth;
  final double dashSpace;
  final Color color;

  const DashedLineView({
    this.height = 1,
    this.dashWidth = 5,
    this.dashSpace = 3,
    this.color = Colors.grey,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double totalWidth = constraints.maxWidth;
        final int dashCount = (totalWidth / (dashWidth + dashSpace)).floor();

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(dashCount, (index) {
            return Container(
              width: dashWidth,
              height: height,
              color: color,
              margin: EdgeInsets.only(right: dashSpace),
            );
          }),
        );
      },
    );
  }
}
