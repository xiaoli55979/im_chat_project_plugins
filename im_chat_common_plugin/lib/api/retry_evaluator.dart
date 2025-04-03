import 'dart:async';

import 'package:dio/dio.dart';
import 'package:line_detection_plugin/line_detection.dart';

class RemoveRetryEvaluator {
  /// 判断是否需要重试
  FutureOr<bool> evaluate(DioException error, int attempt, int retries) async {
    bool shouldRetry = false, shouldRemove = false;
    // print("object_shouldRetry:$shouldRetry  error.type:${error.type}");
    if (error.type == DioExceptionType.badResponse) {
      final statusCode = error.response?.statusCode;
      // print("object_shouldRetry:$shouldRetry  statusCode:${statusCode}");
      if (statusCode != null) {
        shouldRetry = isRetryable(statusCode);
        shouldRemove = isRemoveable(statusCode);
      } else {
        shouldRetry = true;
        shouldRemove = true;
      }
    } else {
      /// 在线状态下才触发重试和删除
      if (NetworkManager.instance.networkStatus == 2) {
        shouldRemove = shouldRetry = error.type != DioExceptionType.cancel && error.error is! FormatException;
      }
    }

    /// 如果需要移除
    if (shouldRemove) {
      var notAvailableList = error.requestOptions.extra['notAvailableList'] as List?;

      /// 添加到不可用线路列表
      notAvailableList?.add("${error.requestOptions.uri.scheme}://${error.requestOptions.uri.host}");
    }
    return shouldRetry && attempt <= retries;
  }

  /// 是否要移除线路
  bool isRemoveable(int statusCode) => statusCode != 590 && (statusCode < 400 || statusCode == 403 || statusCode > 503);

  /// 使用要重试
  bool isRetryable(int statusCode) => (statusCode < 400 || statusCode == 403 || statusCode == 404 || statusCode == 429 || statusCode > 500);
}
