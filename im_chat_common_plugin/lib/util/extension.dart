import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:lpinyin/lpinyin.dart';

extension MapExtension on Map<String, dynamic> {
  void setIfNotNull({required dynamic value, required String key}) {
    if (value != null) {
      this[key] = value;
    }
  }

  Map<String, String> convertMap(){
    return Map.fromEntries(
        entries
            .where((entry) => entry.value != null)
            .map((entry) => MapEntry(entry.key, entry.value.toString()))
    );
  }
}

extension FirstLetterExtension on String? {

  String getFirstLetter() {
    // 处理 null 或空字符串
    if (isEmptyString()) {
      return '#';
    }

    // 获取第一个字符
    String firstChar = this![0];

    // 判断是否为数字
    if (RegExp(r'^[0-9]$').hasMatch(firstChar)) {
      return '#';
    }

    // 判断是否为中文字符
    if (RegExp(r'[\u4e00-\u9fa5]').hasMatch(firstChar)) {
      String pinyin = PinyinHelper.getShortPinyin(firstChar);
      return pinyin.isNotEmpty ? pinyin[0].toUpperCase() : '#';
    }

    // 判断是否为英文字母
    if (RegExp(r'^[A-Za-z]$').hasMatch(firstChar)) {
      return firstChar.toUpperCase();
    }

    // 其他情况（特殊字符、非中英文字符等）
    return '#';
  }
}

extension StringExtension on String? {
  bool isEmptyString() {
    return isEmpty(this);
  }

  bool isNotEmptyString() {
    return isNotEmpty(this);
  }

  static bool isEmpty(String? text) {
    if (text == null) {
      return true;
    }
    return text.isEmpty;
  }

  static bool isNotEmpty(String? text) {
    if (text == null) {
      return false;
    }
    return text.isNotEmpty;
  }

  String? parseHtmlToPlainText() {
    // 用正则移除所有 HTML 标签
    return this?.replaceAll(RegExp(r'<[^>]*>'), '')
        .replaceAll(RegExp(r'(\n|\r|\t)'), '') // 仅移除换行类字符
        .replaceAll(RegExp(r' {2,}'), ' ')     // 合并连续空格
        .trim();
  }

  void copy() {
    Clipboard.setData(ClipboardData(text: this ?? ''));
    EasyLoading.showSuccess('复制成功');
  }

  Size size({TextStyle? style, double minWidth = 0.0, double maxWidth = double.infinity}) {
    if (isEmpty(this)) {
      return Size.zero;
    }
    TextPainter painter = TextPainter(
      text: TextSpan(
        text: this,
        style: style,
        locale: Get.locale,
      ),
      textDirection: TextDirection.ltr,
    );

    painter.layout(minWidth: minWidth, maxWidth: maxWidth);
    return painter.size;
  }
}
