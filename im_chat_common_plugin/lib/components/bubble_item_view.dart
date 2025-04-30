import 'package:flutter/material.dart';

import '../models/multiple_item_enum.dart';

class ChatBubble extends StatelessWidget {
  final bool isLeft;
  final String content;
  final String timestamp;
  final void Function(BuildContext context, Offset offset, bool isLeft)
  onMorePressed;

  const ChatBubble({
    super.key,

    required this.isLeft,
    required this.content,
    required this.timestamp,
    required this.onMorePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
      isLeft ? MainAxisAlignment.start : MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isLeft)
          const CircleAvatar(
            radius: 16,
            child: Icon(Icons.person, size: 16),
          ),
        if (isLeft) const SizedBox(width: 8),
        Flexible(
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isLeft ? Colors.blue[100] : Colors.green[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment:
              isLeft ? CrossAxisAlignment.start : CrossAxisAlignment.end,
              children: [
                Text(
                  content,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text(
                  timestamp,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ),
        if (!isLeft) const SizedBox(width: 8),
        GestureDetector(
          onTapDown: (details) {
            final offset = details.globalPosition;
            onMorePressed(context, offset, isLeft);
          },
          child: const Icon(Icons.more_vert),
        ),
      ],
    );
  }
}

class BubbleView extends StatelessWidget {
  final bool isLeft;
  final VoidCallback onDismiss;
  final Offset viewOffset; // 视图左上角的全局坐标
  final List<MultipleItemEnum> menuItems; // 动态生成的菜单项
  final void Function(MultipleItemEnum) didSelectItem;

  const BubbleView(
      {super.key,
        required this.isLeft,
        required this.onDismiss,
        required this.viewOffset,
        required this.menuItems,
        required this.didSelectItem
      });

  @override
  Widget build(BuildContext context) {
    print("item.label${menuItems}");
    return

      GestureDetector(
        onTap: onDismiss,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: isLeft ? Alignment.topLeft : Alignment.topRight,
          children: [
            // Bubble container
            // Positioned(
            //   top: -180, // 距离触发点向上偏移的值（根据需求调整）
            //   left: isLeft ? -20 : null, // 左对齐时的偏移量
            //   right: isLeft ? null : -20, // 右对齐时的偏移量
            //   child:
            Container(
              width: 280,
              height: 130,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(12),
              ),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 4,
                // mainAxisSpacing: 8,
                // crossAxisSpacing: 8,
                padding: const EdgeInsets.all(0), // 添加内边距

                children: menuItems.map((item) => _buildMenuItem(item))
                    .toList(),
              ),
              // ),
            ),
            // Triangle below bubble
            Positioned(
              bottom: -10.5,
              left: isLeft ? 20 : null,
              right: isLeft ? null : 20,
              child: CustomPaint(
                size: const Size(20, 10),
                painter: TrianglePainter(color: Colors.grey[800]!),
              ),
            ),
          ],
        ),
      );
  }

  Widget _buildMenuItem(MultipleItemEnum item) {
    print("item.label${item.label}");
    return GestureDetector(
      onTap: () {
        didSelectItem.call(item);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Image.asset(item.iconPath, width: 24, height: 24, color: Colors.white),
          Icon(Icons.select_all),
          const SizedBox(height: 4),
          Text(
            item.label,
            style: const TextStyle(fontSize: 12, color: Colors.white),
          ),
        ],
      )
    );
  }
}

class TrianglePainter extends CustomPainter {
  final Color color;

  TrianglePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color;

    final path = Path()
      ..moveTo(size.width / 2, size.height) // 从底部中间开始
      ..lineTo(0, 0) // 画到左上角
      ..lineTo(size.width, 0) // 画到右上角
      ..close(); // 闭合路径形成倒三角

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
