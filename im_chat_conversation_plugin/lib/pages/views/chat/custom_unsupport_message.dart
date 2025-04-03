import 'package:flutter/material.dart';

class CustomUnsupportMessage extends StatelessWidget {
  const CustomUnsupportMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(2),
        color: Colors.grey[200],
      ),
      child: Text("未知类型"),
    );
  }
}
