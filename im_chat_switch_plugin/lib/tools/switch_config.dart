import 'package:flutter/material.dart';

class SwitchConfig {
  /// 时区间隔,跟东8区对比
  final int timeZone;

  final bool checkPwd;
  final Color color;
  final Color buttonColor;

  const SwitchConfig({
    this.timeZone = 1,
    this.checkPwd = true,
    this.color = Colors.orange,
    this.buttonColor = Colors.blue,
  });
}
