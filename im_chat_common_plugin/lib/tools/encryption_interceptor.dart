import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'encryption_utils.dart';
import 'logger_utils.dart';

class EncryptionInterceptor extends Interceptor {
  // int codeIndex = ToolsUtils.instance.codeIndex;

  /// 数据解密
  Map<String, dynamic> decrypt(String data, String? iv, {required int index}) {
    try {
      if (data.isEmpty) return {};
      String resultStr = EncryptionUtil.acdec(data.toString(), iv, index: index);
      Map<String, dynamic> mapResult = {};
      if (resultStr.isNotEmpty) {
        mapResult = jsonDecode(resultStr);
      }
      debugPrint("decrypt_:${mapResult.toString()}");
      return mapResult;
    } catch (e, stackTrace) {
      LoggerUtils.error(e, error: "接口数据解密异常", scopeCallback: (Scope scope) {
        scope.setTag(LogType.DATA.label, "DecryptError");
      }, stackTrace: stackTrace);
      Map<String, dynamic> mapResult = {};
      return mapResult;
    }
  }

  /// 数据加密
  String encryptStr(String data, String? iv, {required int index}) {
    try {
      // debugPrint("encrypt_:${data.toString()}");
      String resultStr = EncryptionUtil.deacdec(data.toString(), iv, index: index);
      debugPrint("encrypt_resultStr:$resultStr");
      // Map<String, dynamic> mapResult = {"data": resultStr};
      return resultStr;
    } catch (e, stackTrace) {
      LoggerUtils.error(e, error: "接口数据加密异常", scopeCallback: (Scope scope) {
        scope.setTag(LogType.DATA.label, "EncryptError");
      }, stackTrace: stackTrace);
      // Map<String, dynamic> mapResult = {"data": ''};
      // return mapResult;
      return "";
    }
  }

  // /// 数据加密
  // Map<String, dynamic> encrypt(String data, String? iv, {required int index}) {
  //   try {
  //     debugPrint("encrypt_:${data.toString()}");
  //     String resultStr = EncryptionUtil.deacdec(data.toString(), iv, index: index);
  //     debugPrint("encrypt_resultStr:$resultStr");
  //     Map<String, dynamic> mapResult = {"data": resultStr};
  //     return mapResult;
  //   } catch (e, stackTrace) {
  //     LoggerUtils.error(e, error: "接口数据加密异常", scopeCallback: (Scope scope) {
  //       scope.setTag(LogType.DATA.label, "EncryptError");
  //     }, stackTrace: stackTrace);
  //     Map<String, dynamic> mapResult = {"data": ''};
  //     return mapResult;
  //   }
  // }

  /// 请求
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // String? getIv = options.headers["x-sign"];
    // String? path = options.path;
    // debugPrint("options_request_path: $path");
    //
    // if (getIv != null || path.startsWith("/key/get")) {
    //   super.onRequest(options, handler);
    // } else {
    //   String? iv = ToolsUtils.getAesIv();
    //   String ency = ""; //EncryptionUtil.deacdec(ToolsUtils.instance.userAgent, iv, index: codeIndex);
    //   String resultStr = Uri.encodeComponent(ency);
    //   options.headers["User-Agent"] = "ua_$resultStr";
    //   options.headers["x-sign"] = iv;
    //   options.headers["x-key"] = Uri.encodeComponent(EncryptionUtil.rsaEncryption2(EncryptionUtil.dcyppt(EncryptionUtil.generateAESKey())));
    //
    //   // 如果 options.data 不为空，进行加密
    //   // if (options.data != null) {
    //   //   if (options.data is String) {
    //   //     options.data = encryptStr(options.data, iv, index: codeIndex);
    //   //   } else if (options.data is Map<String, dynamic>) {
    //   //     options.data = encryptStr(jsonEncode(options.data), iv, index: codeIndex);
    //   //   }
    //   // }
    //
    //   // 加密 queryParameters
    //   if (options.queryParameters.isNotEmpty) {
    //     final queryParams = options.queryParameters.map((key, value) => MapEntry(key, value.toString()));
    //     String queryString = Uri(queryParameters: queryParams).query;
    //     path = '$path?$queryString';
    //     // 清空 queryParameters 避免重复拼接
    //     options.queryParameters.clear();
    //   }
    //
    //   // 加密 path
    //   if (path.startsWith("/api")) {
    //     String encryptedPath = Uri.encodeComponent(EncryptionUtil.deacdec(Uri.encodeFull(path), iv, index: codeIndex));
    //     options.path = "/$encryptedPath";
    //   }
    //
    //   // if (options.data != null) {
    //   //   debugPrint("onRequest: ${options.data}");
    //   // }

    super.onRequest(options, handler);
    // }
  }

// 相应
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    // if (response.data != null) {
    //   String? iv = response.requestOptions.headers["x-sign"];
    //   if (iv != null) {
    //     int? siv = response.requestOptions.headers["x-sign-v"] ?? codeIndex;
    //     if (response.data is String) {
    //       response.data = decrypt(response.data, iv, index: siv!);
    //     } else if (response.data is Map<String, dynamic>) {
    //       response.data = decrypt(jsonEncode(response.data), iv, index: siv!);
    //     }
    //   }
    //   // if (response.requestOptions.path.startsWith("/d/")) {
    //   // String resultStr = EncryptionUtil.acdec(Uri.decodeComponent(response.requestOptions.path.substring(3)), iv, index: codeIndex);
    //   // String resultStr = EncryptionUtil.acdec(Uri.decodeComponent(response.requestOptions.path.substring(1)), iv, index: codeIndex);
    //   // debugPrint("object_response1:${response.requestOptions.path}");
    //   // debugPrint("object_response_path:$resultStr");
    //   // response.requestOptions.path = resultStr;
    //   // }
    // }

    if (response.data != null) {
      if (response.data is List<dynamic>) {
        List<dynamic> dataList = response.data as List<dynamic>;
        if (dataList.isEmpty) {
          response.data = {
            "data": dataList,
            "code": 200,
            "msg": "",
          }; // 空数组转为 {"list": []}
          print("转换后的数据: ${response.data}");
        } else {
          response.data = {
            "data": dataList,
            "code": 200,
            "msg": "",
          }; // 非空数组转为 {"list": [item1, item2, ...]}
        }
      }
    }

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // if (err.response != null) {
    //   /// 有加密的才解密
    //   String? iv = err.requestOptions.headers["x-sign"];
    //   if (iv != null) {
    //     int? siv = err.requestOptions.headers["x-sign-v"] ?? codeIndex;
    //     err.response!.data = decrypt(err.response!.data, iv, index: siv!);
    //   }
    // }
    super.onError(err, handler);
  }
}
