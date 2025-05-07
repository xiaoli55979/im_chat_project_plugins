import 'dart:async';

import 'package:flutter/material.dart';
import 'package:im_chat_common_plugin/l10n/SlocalUtils.dart';

class VoiceRecordOverlay extends StatelessWidget {
  final ValueNotifier<bool> isCancelling;
  final ValueNotifier<int> remainingTime;

  const VoiceRecordOverlay({
    super.key,
    required this.isCancelling,
    required this.remainingTime,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 180,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // 倒计时
            ValueListenableBuilder<int>(
              valueListenable: remainingTime,
              builder: (context, value, child) {
                return Text(
                  "00:${value.toString().padLeft(2, '0')}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
            // 麦克风图标
            ValueListenableBuilder<bool>(
              valueListenable: isCancelling,
              builder: (context, value, child) {
                return Icon(
                  Icons.mic,
                  size: 50,
                  color: value ? Colors.red : Colors.white,
                );
              },
            ),
            // 提示文字
            ValueListenableBuilder<bool>(
              valueListenable: isCancelling,
              builder: (context, value, child) {
                return Text(
                  value ? "Release to Cancel" : "Release to Send",
                  style: TextStyle(
                    color: value ? Colors.red : Colors.white70,
                    fontSize: 14,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}