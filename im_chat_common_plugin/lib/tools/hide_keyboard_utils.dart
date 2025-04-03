import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// todo：键盘移除焦点工具
class HideKeybUtils {
  /// 关闭键盘并保留焦点
  static Future<void> hideKeyShowfocus() async {
    await SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  /// 关闭键盘并失去焦点
  static Future<void> hideKeyShowUnfocus() async {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
