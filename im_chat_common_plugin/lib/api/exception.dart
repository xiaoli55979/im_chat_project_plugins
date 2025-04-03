import 'package:dio/dio.dart';

/// ApiException
class ApiException implements Exception {
  static const String defaultMessage = "系统开小差，请稍后再试！";

  final String message;
  final int code;

  ApiException([this.code = -1, this.message = defaultMessage]);

  @override
  String toString() {
    return "($code) $message";
  }

  /// 解析 DioException
  factory ApiException.create(DioException error) {
    switch (error.type) {
      case DioExceptionType.cancel:
        return BadRequestException(-1, "请求取消");
      case DioExceptionType.connectionTimeout:
        return BadRequestException(-2, "连接超时, 请稍后再试");
      case DioExceptionType.sendTimeout:
        return BadRequestException(-3, "请求超时, 请稍后再试");
      case DioExceptionType.receiveTimeout:
        return BadRequestException(-4, "响应超时, 请稍后再试");
      case DioExceptionType.connectionError:
        return BadRequestException(-5, "网络连接错误, 请检查网络");
      case DioExceptionType.unknown:
        return BadRequestException(-6, "未知错误: ${error.error?.toString()}");

      case DioExceptionType.badResponse:
        {
          try {
            final data = error.response?.data;
            int statusCode = error.response?.statusCode ?? -1;

            int errCode =
                (data is Map<String, dynamic> && data.containsKey("status")) ? (data["status"] as int? ?? statusCode) : statusCode;

            String errMsg = (data is Map<String, dynamic> && data.containsKey("msg")) ? (data["msg"] as String? ?? "服务器错误") : "服务器错误";

            switch (statusCode) {
              case 400:
                return BadRequestException(errCode, errMsg);
              case 401:
                return UnauthorisedException(errCode, errMsg);
              case 403:
                return BadRequestException(errCode, "线路繁忙，请稍后再试");
              case 404:
                return BadRequestException(errCode, "找不到服务器，请检查地址");
              case 405:
                return BadRequestException(errCode, "请求方法不允许");
              case 429:
                return BadRequestException(errCode, "操作过于频繁，请稍后再试");
              case 500:
                return BusinessException(errCode, errMsg);
              case 502:
                return BadRequestException(errCode, "无效的请求，请稍后再试");
              case 503:
                return BadRequestException(errCode, "服务器不可用，请稍后再试");
              case 505:
                return BadRequestException(errCode, "HTTP 版本不支持");
              default:
                return ApiException(errCode, "服务器异常，请稍后再试");
            }
          } catch (_) {
            return ApiException(-1, defaultMessage);
          }
        }

      default:
        return ApiException(-1, error.error?.toString() ?? "未知错误");
    }
  }
}

/// 请求错误
class BadRequestException extends ApiException {
  BadRequestException([int? code, String? message]) : super(code ?? -1, message ?? ApiException.defaultMessage);
}

/// 未认证异常
class UnauthorisedException extends ApiException {
  UnauthorisedException([int? code, String? message]) : super(code ?? -1, message ?? "没有权限");
}

/// 业务异常
class BusinessException extends ApiException {
  BusinessException([int? code, String? message]) : super(code ?? -1, message ?? ApiException.defaultMessage);
}
