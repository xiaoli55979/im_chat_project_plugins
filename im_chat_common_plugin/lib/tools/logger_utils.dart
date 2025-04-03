import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../api/exception.dart';

enum LogLevel {
  DEBUG(0),
  INFO(1),
  WARN(2),
  ERROR(3);

  final int value;
  const LogLevel(this.value);

  static LogLevel? fromValue(int value) {
    const defaultLogLevel = LogLevel.INFO;
    return LogLevel.values.firstWhere(
      (level) => level.value == value,
      orElse: () => defaultLogLevel,
    );
  }

  String get label {
    switch (this) {
      case LogLevel.DEBUG:
        return 'DEBUG';
      case LogLevel.INFO:
        return 'INFO';
      case LogLevel.WARN:
        return 'WARN';
      case LogLevel.ERROR:
        return 'ERROR';
    }
  }
}

enum LogType {
  INFO(0),
  ERROR(1),
  LINE(2),
  LOGDING(3),
  API(4),
  HTTPDNS(5),
  FILETRANSFER(6),
  DATA(7),
  FUNCTION(8),
  NETSTATUS(9),
  RELOGIN(10);

  final int value;
  const LogType(this.value);

  static LogType? fromValue(int value) {
    const defaultLogType = LogType.ERROR;
    return LogType.values.firstWhere(
      (type) => type.value == value,
      orElse: () => defaultLogType,
    );
  }

  String get label {
    switch (this) {
      case LogType.INFO:
        return 'Info';
      case LogType.ERROR:
        return 'Error';
      case LogType.LINE:
        return 'LineChaekError';
      case LogType.LOGDING:
        return 'AppLaunchError';
      case LogType.API:
        return 'ApiError';
      case LogType.HTTPDNS:
        return 'HttpDndError';
      case LogType.FILETRANSFER:
        return 'FileTransferError';
      case LogType.DATA:
        return 'DataError';
      case LogType.FUNCTION:
        return 'DeviceFuncError';
      case LogType.NETSTATUS:
        return 'NetWorkStatus';
      case LogType.RELOGIN:
        return 'AppReLaunchSuccess';
    }
  }
}

typedef ScopeCallback = void Function(Scope scope);

class LoggerUtils {
  static var logger = Logger(
    printer: PrettyPrinter(
      errorMethodCount: 10,
      lineLength: 130,
      printTime: true,
    ),
  );
  static void debug(Object? message, {String? error}) {
    if (!kDebugMode) return;
    logger.i(message.toString(), error: error ?? "Debug Message");
  }

  static void info(Object? message, {String? error, LogLevel? level}) {
    if (!kDebugMode) return;
    logger.i(message.toString(), error: error ?? "Info Message");
  }

  /// 异常日志
  static void error(Object? message, {dynamic stackTrace, String? error, ScopeCallback? scopeCallback, LogLevel? level, LogType? type}) {
    if (scopeCallback != null) {
      Sentry.captureException(message, withScope: (socpe) {
        scopeCallback(socpe);
      });
    } else if (stackTrace != null) {
      // ApputilHandle.onUpdateBugly(message, stackTrace: stackTrace);
    } else {
      String msg = error ?? "";
      String uploadMsg = message.toString();
      if (uploadMsg.isNotEmpty) {
        msg = msg.isNotEmpty ? "name:$msg msg:$uploadMsg" : "msg:$uploadMsg";
        if (level == LogLevel.ERROR && type != null) {
          // ApputilHandle.onUpdateBugly(message, stackTrace: StackTrace.current);
        }
      }
    }

    if (!kDebugMode) return;
    logger.e(message.toString(), error: error ?? "Error Message");
  }

  static void warn(Object? message, {String? error}) {
    if (!kDebugMode) return;
    logger.w(message.toString(), error: error ?? "Warning Message");
  }

  /// API 接口异常上报处理
  static void apiError(Object? message, {dynamic stackTrace, ScopeCallback? scopeCallback}) {
    String errptTypeName = LogType.API.label;
    if (message is DioException) {
      var error = message.error;
      errptTypeName = error != null
          ? "${error.runtimeType}_Code:${message.response?.statusCode ?? 0}"
          : "DioException_Code:${message.response?.statusCode ?? 0}";
    } else if (message is SocketException) {
      errptTypeName = "SocketException";
    }

    SentryLevel live = SentryLevel.info;

    LoggerUtils.error(message, stackTrace: stackTrace, scopeCallback: (Scope scope) {
      scope.setTag(LogType.API.label, errptTypeName);
      scope.level = live;
      scopeCallback?.call(scope); // 调用可选的 scopeCallback
    }, level: LogLevel.ERROR);
  }

  // /// 设置异常上报上下文信息
  // static void setUserInformation(MemberEntity? member) {
  //   if (member != null) {
  //     Sentry.configureScope((scope) {
  //       scope.setUser(SentryUser(
  //         username: member.username,
  //       ));
  //     });
  //   } else {
  //     Sentry.configureScope((scope) => scope.setUser(null));
  //   }
  // }

  static bool shouldHandleError(Object? error) {
    if (error == null) return false;
    if (error is BusinessException || error is UnauthorisedException) {
      return true;
    }
    return false;
  }
}
