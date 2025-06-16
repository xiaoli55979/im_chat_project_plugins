import 'package:flutter/material.dart';
import 'package:im_chat_common_plugin/config/color/colors.dart';
import 'package:im_chat_common_plugin/util/fonts.dart';
import 'package:im_chat_common_plugin/widget/bottom_sheet/option_sheet.dart';
import 'package:im_chat_common_plugin/widget/triangle_painter.dart';

class BubbleView<T extends OptionItem> extends StatelessWidget {
  const BubbleView(
    this.menuItems, {
    super.key,
    required this.isLeft,
    required this.action,
  });

  final bool isLeft;
  final List<T> menuItems;
  final void Function(T) action;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: isLeft ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
        Container(
          width: 280,
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(12),
          ),
          child: GridView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(vertical: 12),
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, // 每行的列
              mainAxisSpacing: 20, // 垂直间隔
              mainAxisExtent: 40,
            ),
            itemCount: menuItems.length,
            itemBuilder: (context, index) {
              var item = menuItems[index];
              return _buildMenuItem(item);
            },
          ),
          // ),
        ),
        Padding(
          padding: EdgeInsets.only(left: isLeft ? 10 : 0, right: isLeft ? 0 : 10),
          child: CustomPaint(
            size: Size(20, 10),
            painter: TrianglePainter(isPointingDown: true, color: Colors.grey[800]!),
          ),
        ),
      ],
    );
  }

  _buildMenuItem(T item) {
    return GestureDetector(
        onTap: () {
          action.call(item);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.select_all),
            CommonText.instance(item.title, 12, color: IMColors.white, height: 1.0),
          ],
        ));
  }
}