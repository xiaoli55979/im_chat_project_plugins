import 'dart:io';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../tools/cache_manager.dart';
import '../tools/password_manager.dart';
import '../tools/sync_code_generator.dart';
import '../tools/time_zone_util.dart';

class SwitchkitManager {
  // 单例模式的实例
  static final SwitchkitManager _instance = SwitchkitManager._internal();

  // 私有的构造函数
  SwitchkitManager._internal();

  // 提供一个工厂构造函数，返回单例实例
  factory SwitchkitManager() {
    return _instance;
  }

  // 方法接收两个回调函数、一个日期字符串
  // time:2024-09-25 22:00:50
  // appStoreBuild:是否是TF版本,默认是,是才检测时区
  // checkTimeZoom:是否检测时区,如果符合,走onTimeExceeded 否则走onTimeNotReached
  void executeBasedOnTime({
    bool appStoreBuild = true,
    bool checkTimeZoom = false,
    int timeZone = 2, // 区间
    required void Function() onTimeNotReached,

    /// 未跳转
    required void Function() onTimeExceeded,

    /// 跳转
    String? timeToCompare,
    List<String>? timeZones,
  }) async {
    /// 初始化缓存管理
    await CacheManager().init();

    /// 如果是安卓的则直接不处理
    if (Platform.isAndroid) {
      onTimeExceeded();
      return;
    }

    /// 如果不是APPSTORE版本则不处理
    if (!appStoreBuild) {
      onTimeExceeded();
      return;
    }

    /// 获取是否有配置了
    final syncCodeGenerator = SyncCodeGenerator();
    bool? switchStatus = await CacheManager().getBool(syncCodeGenerator.getSwitchKey());
    if (switchStatus != null && switchStatus) {
      onTimeExceeded();
      return;
    }

    /// 获取是否有配置了企业ID
    String? companyId = await PasswordManager.getCompanyId();
    if (companyId.isNotEmpty) {
      onTimeExceeded();
      return;
    }

    /// 检测时区,东7区到东9区才可以
    bool status = TimeZoneUtil.supportTimeZone(appStoreBuild: appStoreBuild, timeZone: timeZone);
    if (!status) {
      onTimeNotReached();
      return;
    }

    /// 检测时区
    if (checkTimeZoom && status) {
      setAvable(syncCodeGenerator);
      onTimeExceeded();
      return;
    }

    /// 检测剪贴板内容
    ClipboardData? clipboardData = await Clipboard.getData('text/plain');
    String clipboardContent = clipboardData?.text ?? "";
    if (clipboardContent.isNotEmpty) {
      /// 验证同步码是否有效
      bool isValid = syncCodeGenerator.isSyncCodeValid(clipboardContent);
      if (isValid) {
        setAvable(syncCodeGenerator);
        onTimeExceeded();
        return;
      }
    }

    /// 检测时间
    final DateTime currentTime = DateTime.now();
    DateTime? targetTime;
    if (timeToCompare != null) {
      targetTime = DateFormat('yyyy-MM-dd HH:mm:ss').parse(timeToCompare);
    }
    if (targetTime != null) {
      if (currentTime.isBefore(targetTime)) {
        onTimeNotReached();
      } else {
        setAvable(syncCodeGenerator);
        onTimeExceeded();
      }
      return;
    }

    /// 都不符合,走默认关闭
    onTimeNotReached();
  }

  /// 设置缓存
  Future<void> setAvable(SyncCodeGenerator syncCodeGenerator) async {
    await CacheManager().setBool(syncCodeGenerator.getSwitchKey(), true);
    await Clipboard.setData(const ClipboardData(text: ''));
  }
}
