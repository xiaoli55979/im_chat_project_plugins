import 'package:flutter/material.dart';

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