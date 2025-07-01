import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class PushNotificationService {
  /// APP生命周期通知
  static const String lifecycleState = "AppLifecycleState";
  static const String _channelName = "PushNotificationChannel";
  static const MethodChannel _channel = MethodChannel(_channelName);
  static bool _isHandlerSet = false;

  /// 请求通知权限
  static Future<void> requestPushNotificationPermission() async {
    try {
      await _channel.invokeMethod("requestNotificationPermissions");
    } on PlatformException catch (e) {
      // throw PlatformException(
      //   message: e.message,
      //   code: e.code,
      //   details: 'Failed to request notification permissions: ${e.details}',
      // );
    }
  }

  /// 注册设备
  static Future<void> registerDevice() async {
    try {
      await _channel.invokeMethod("registerForPushNotifications");
    } on PlatformException catch (e) {
      // throw PlatformException(
      //   message: e.message,
      //   code: e.code,
      //   details: 'Failed to register device for push notifications: ${e.details}',
      // );
    }
  }

  /// 获取设备令牌
  static Future<String?> retriveDeviceToken() async {
    try {
      return await _channel.invokeMethod<String>("retrieveDeviceToken");
    } catch (e) {
      debugPrint("Failed to retrieve device token: $e");
      return "";
    }
  }

  static void handlerPushNotificationData() {
    if (_isHandlerSet) return;
    _isHandlerSet = true;

    // 检查是否有启动时的推送
    Future.delayed(Duration.zero, () async {
      final Map<dynamic, dynamic>? launchData = await _channel.invokeMethod("getLaunchNotification");
      if (launchData != null) {
        _processPushNotification(launchData);
      }
    });

    _channel.setMethodCallHandler((call) async {
      if (call.method == "onPushNotification") {
        _processPushNotification(call.arguments);
      } else {
        // DialogUtils.showError("call.method:${call.method}");
      }
    });
  }

  static void _processPushNotification(dynamic rawData) {
    if (rawData is String) {
      try {
        rawData = jsonDecode(rawData);
      } catch (e) {
        debugPrint("JSON Decode Error: $e");
        // DialogUtils.showError("userInfo: JSON Decode Error");
        return;
      }
    }

    if (rawData is Map) {
      try {
        final userInfo = rawData.map((key, value) => MapEntry(key.toString(), value));
        debugPrint("received_push_notification:$userInfo");
        // ApnsNotificationModelEntity modeEntity = ApnsNotificationModelEntity.fromJson(userInfo);

        /// 根据实际业务的code进行处理
        // debugPrint("received_push_notification_code::${modeEntity.code}");
      } catch (e) {}
    } else {
      debugPrint("Invalid push notification format: $rawData");
      // DialogUtils.showError("userInfo: Invalid");
    }
  }
}
