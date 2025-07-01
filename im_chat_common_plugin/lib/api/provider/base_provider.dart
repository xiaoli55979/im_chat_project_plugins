import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:common_utils/common_utils.dart';
import 'package:device_info/device_info.dart';
import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart' as getx;
import 'package:im_chat_common_plugin/api/exception.dart';
import 'package:im_chat_common_plugin/api/retry_evaluator.dart';
import 'package:im_chat_common_plugin/models/response/base_response_entity.dart';
import 'package:im_chat_common_plugin/models/response/result.dart';
import 'package:im_chat_common_plugin/services/global_service.dart';
import 'package:im_chat_common_plugin/tools/encryption_interceptor.dart';
import 'package:im_chat_common_plugin/tools/link_utils.dart';
import 'package:im_chat_common_plugin/tools/logger_utils.dart';
import 'package:im_chat_common_plugin/tools/my_shared_pref.dart';
import 'package:im_chat_common_plugin/tools/tools_utils.dart';
import 'package:im_chat_common_plugin/util/app_util.dart';
import 'package:line_detection_plugin/line_detection.dart';
import 'package:path/path.dart' as p;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:sentry_dio/sentry_dio.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

typedef ConstructionAction<B> = B Function(dynamic data);

typedef DecoderAction<T, B> = T Function(dynamic data, ConstructionAction<B> construction);

/// 基类封装Dio
abstract class BaseProvider extends getx.GetConnect {
  // String? _userAgent;

  int index = 0;

  /// API
  Dio? _dio;

  /// OSS
  Dio get dio => _dio ??= _initDio();

  /// init dio
  Dio _initDio() {
    /// mqtt日志
    if (ToolsUtils.instance.isDebugModel) {
      // ToolsUtils.instance.mqttLog = true;
    }

    var appUrl = ToolsUtils.instance.isDebugModel
        ? LinkUtils.testBaseUrl
        : MySharedPref.getBaseUrl() ?? LinkUtils.prodBaseUrl;
    LoggerUtils.info(appUrl);
    updateMqtt(appUrl);

    /// 初始化dio
    Dio __dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        sendTimeout: const Duration(seconds: 10),
        baseUrl: appUrl,
      ),
    );

    /// 添加异常上报处理
    __dio.addSentry();

    /// 添加数据解密拦截器
    __dio.interceptors.add(EncryptionInterceptor());

    /// 自定义拦截器
    __dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          /// 获取头信息
          // ToolsUtils.instance.userAgent = await getUserAgent();

          /// 只有api才需要加认证头
          // bool fileUpload = options.path.startsWith("/d/");

          /// 认证头加入
          // if (GlobalService.to.token != null && fileUpload) {
          // options.headers['Authorization'] = 'Bearer ${GlobalService.to.token}';
          // }
          options.headers['X-App-Version'] = await ToolsUtils.getVersion();
          options.headers['X-Device-Type'] =
              ToolsUtils.getPlatform(); // 1:PC 2:IOS 3:Android
          options.headers['bundle_id'] =
              ToolsUtils.instance.deviceInfo?.package.packageName ?? "";
          if (GlobalService.to.token != null) {
            // options.headers['token'] = '${GlobalService.to.token}';
            options.headers['Authorization'] =
                'Bearer ${GlobalService.to.token}';
          }
          print("object_headers:${options.headers}");

          /// next
          handler.next(options);
        },
        onResponse: (response, handler) {
          handler.next(response);
        },
        onError: (error, handler) async {
          /// 如果调用报了连接错误触发网络检查
          if ((error.type == DioExceptionType.connectionError ||
                  error.type == DioExceptionType.connectionTimeout) &&
              NetworkManager.instance.networkStatus == 2) {
            await NetworkManager.instance.checkNetwork();
          }

          /// 自定义异常处理
          handler.next(error.copyWith(error: ApiException.create(error)));
        },
      ),
    );

    if (kDebugMode) {
      /// 日志格式化显示
      __dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        compact: false,
        logPrint: LogUtil.v,
      ));
    }

    /// 添加重试拦截器
    initDioRetry(__dio);

    return __dio;
  }

  /// 初始化重试拦截器
  void initDioRetry(Dio __dio) {
    if (!ToolsUtils.instance.isDebugModel) {
      RetryInterceptor dioRetry = RetryInterceptor(
        dio: __dio,
        logPrint: LogUtil.v,
        // specify log function (optional)
        retryEvaluator: RemoveRetryEvaluator().evaluate,
        // retry
        onBeforeRetry: (options) {
          /// 文件上传失败重试
          /// 从 extra 中获取文件对象
          File? file = options.extra['file'];
          if (file != null) {
            // /// 重新生成文件流
            final retryableFile =
                createMultipartFileRecreatable(file, options.extra['filename']);

            /// 创建 FormData
            FormData formData = FormData.fromMap({'file': retryableFile});
            options.data = formData;
          }

          // 更新 baseUrl
          if (LinkUtils.endpoints.length >= options.attempt) {
            return options.copyWith(
                baseUrl: LinkUtils.endpoints[options.attempt - 1]);
          }

          return options;
        },
        onRetrySuccess: (options) {
          updateBaseUrl(options.baseUrl);
        },
        getRetries: () => LinkUtils.endpoints.length, // retry count (optional)
      );
      __dio.interceptors.add(dioRetry);
      LogUtil.v(LinkUtils.endpoints, tag: "启用API接口重试功能");
      // ToolsUtils.instance.initDioRetry = true;
    }
  }

  /// 统一更新BaseUrl
  updateBaseUrl(String baseUrl) {
    /// 测试
    dio.options.baseUrl = baseUrl;
    // ossDio.options.baseUrl = baseUrl.replaceFirst("app", "oss");
    MySharedPref.setBaseUrl(baseUrl);
    updateMqtt(baseUrl);
    LoggerUtils.info(baseUrl, error: "更新BaseUrl");
    // ApputilHandle.onUpdateBugly("更新BaseUrl:${baseUrl}");
  }

  /// 设置MQTT链接
  void updateMqtt(String url) {
    String mqttUrl = "${url.replaceAll("https", 'wss')}/mqtt";
    LinkUtils.mqttUrl = mqttUrl;
    LinkUtils.mqttPort = 443;
    LogUtil.v(LinkUtils.mqttUrl, tag: "MqttUrl");
  }

  /// 获取header
  static Future<String> getHeader() async {
    String title = ToolsUtils.getAppName();
    String formatversion = await ToolsUtils.getVersion();
    String header = "$title/$formatversion";
    return header;
  }

  /// 获取设备头信息
  static Future<String> getUserAgent() async {
    try {
      String header = await getHeader();
      String userAgent = await userAgentHead(header);
      return userAgent;
    } catch (e) {
      LogUtil.v("UserAgent get error: $e");
      return "";
    }
  }

  Future<Result<T, APIError>> getRequest<T extends APIEntity, B>(
    String url, {
    Map<String, dynamic>? query,
    required ConstructionAction<B> construction,
    required DecoderAction<T, B> decoder,
    Duration? sendTimeout,
    Duration? receiveTimeout,
  }) async {
    return _request(
      url,
      method: "GET",
      query: query,
      decoder: decoder,
      construction: construction,
      sendTimeout: sendTimeout,
      receiveTimeout: receiveTimeout,
    );
  }

  /// post
  Future<Result<T, APIError>> postRequest<T extends APIEntity, B>(
    String url,
    dynamic body, {
    required ConstructionAction<B> construction,
    required DecoderAction<T, B> decoder,
    bool? hideCatch,
    Duration? sendTimeout,
    Duration? receiveTimeout,
  }) {
    return _request(
      url,
      method: "POST",
      body: body,
      decoder: decoder,
      construction: construction,
      sendTimeout: sendTimeout,
      receiveTimeout: receiveTimeout,
      hideCatch: hideCatch,
    );
  }

  /// pust
  Future<Result<T, APIError>> putRequest<T extends APIEntity, B>(
    String url,
    dynamic body, {
    required ConstructionAction<B> construction,
    required DecoderAction<T, B> decoder,
    Duration? sendTimeout,
    Duration? receiveTimeout,
  }) {
    return _request(
      url,
      method: "PUT",
      body: body,
      decoder: decoder,
      construction: construction,
      sendTimeout: sendTimeout,
      receiveTimeout: receiveTimeout,
    );
  }

  /// get
  /// delete
  Future<Result<T, APIError>> deleteRequest<T extends APIEntity, B>(
    String url, {
    Map<String, dynamic>? query,
    required ConstructionAction<B> construction,
    required DecoderAction<T, B> decoder,
    Duration? sendTimeout,
    Duration? receiveTimeout,
  }) async {
    return _request(
      url,
      method: "DELETE",
      query: query,
      decoder: decoder,
      construction: construction,
      sendTimeout: sendTimeout,
      receiveTimeout: receiveTimeout,
    );
  }

  /// 创建 MultipartFileRecreatable 对象时使用流
  MultipartFileRecreatable createMultipartFileRecreatable(
      File file, String key) {
    final stream = file.openRead();
    final length = file.lengthSync(); // 文件长度
    return MultipartFileRecreatable(
      stream,
      length,
      filename: p.basename(key),
    );
  }

  /// 文件上传新接口
  /// key:桶文件路径 如:zfpz/2024/09/10/111.png
  /// name:存储桶名称: 如果不传则默认,如果是IM则传:publicim
  Future<void> uploadFileNew(
    File file, {
    required String key,
    bool? isImFile,
    ProgressCallback? onSendProgress,
  }) async {
    /// 创建MultipartFileRecreatable ，使用文件流上传,不能用MultipartFile 无法实现重试
    final retryableFile = createMultipartFileRecreatable(file, key);

    /// 创建 FormData
    FormData formData = FormData.fromMap({'file': retryableFile, 'path': key});

    /// 添加配置
    // String namePath = "";
    // if (isImFile != null && isImFile) {
    //   namePath = "&&name=publicim";
    // }
    // String url = '/api/v1/mms/front/upload/file?obj=$key$namePath';
    print("来了老弟");
    String url = '/v1/file/upload';
    print("file: $file path: $key");
    try {
      await dio.post(
        url, // 上传接口
        data: formData, // 使用 FormData 作为 data
        options: Options(
          receiveTimeout: const Duration(seconds: 180),
          sendTimeout: const Duration(seconds: 90),
          // extra: {
          //   'file': file,
          //   'path': key,
          // },
        ),
        onSendProgress: onSendProgress, // 上传进度回调
      );
    } catch (e, stackTrace) {
      LoggerUtils.error(e, stackTrace: stackTrace,
          scopeCallback: (Scope scope) {
        scope.setTag(LogType.FILETRANSFER.label, url);
      }, level: LogLevel.ERROR, type: LogType.FILETRANSFER);
      rethrow;
    }
  }

  /// _request 是核心函数，所有的请求都会走这里
  Future<Result<T, APIError>> _request<T extends APIEntity, B>(
    String path, {
    required String method,
    dynamic body,
    Map<String, dynamic>? query,
    Map? params,
    Duration? sendTimeout,
    Duration? receiveTimeout,
    bool? hideCatch, // 是否拦截异常
    required ConstructionAction<B> construction,
    required DecoderAction<T, B> decoder,
  }) async {
    // restful 请求处理
    if (params != null) {
      params.forEach((key, value) {
        if (path.contains(key)) {
          path = path.replaceAll(":$key", value.toString());
        }
      });
    }

    /// 启动事务
    final transaction = Sentry.startTransaction(
      "$method $path",
      "ApiRequest",
      bindToScope: true, // 绑定到 Sentry 作用域
    );

    /// 不可用线路列表
    final notAvailableList = <String>[];

    try {
      Response response = await dio.request(
        path,
        queryParameters: query,
        data: body,
        options: Options(
          method: method,
          sendTimeout: sendTimeout,
          receiveTimeout: receiveTimeout,
          extra: {'notAvailableList': notAvailableList},
          responseType: ResponseType.json,
        ),
      );
      // 获取HTTP状态码
      transaction.status =
          SpanStatus.fromHttpStatusCode(response.statusCode ?? -1);

      try {
        if (response.data['code'] == 401) {
          // 登录失效
          getx.Get.offAllNamed("/login");
        }
        return Result.succss(decoder(response.data, construction));
      } catch (e, stackTrace) {
        transaction.throwable = e;
        transaction.status = const SpanStatus.unknown();
        LoggerUtils.error(e, stackTrace: stackTrace, level: LogLevel.ERROR);
        SmartDialog.dismiss(status: SmartStatus.loading);
        return Result.failure(APIError('解析响应数据异常:$e', -1));
      }
    } on DioException catch (e, stackTrace) {
      print("🔹 错误消息: ${e.message}");
      print("🔹 错误类型: ${e.type}");
      transaction.throwable = e;

      /// 异常上报
      LoggerUtils.apiError(e, stackTrace: stackTrace);

      // if (kDebugMode) {
      //   /// 解析域名IP
      //   ToolsUtils.sendRequestWithResolvedIp(e.requestOptions.uri.toString());
      // }

      var ex = e.error as ApiException;

      if (hideCatch != null && hideCatch) {
        SmartDialog.dismiss(status: SmartStatus.loading);
        return Result.failure(APIError(ex.message, ex.code));
      }

      /// 服务器有返回错误信息
      if (e.type == DioExceptionType.badResponse) {
        transaction.status =
            SpanStatus.fromHttpStatusCode(e.response?.statusCode ?? -1);
        if (ex is BusinessException) {
          // 系统维护状态处理
          // if (ex.code == 9999) {
          //   Get.to(() => SystemMaintainPage());
          //   return Future.error(ApiException(9999, '系统维护中'));
          // }
          // 业务异常提示
          SmartDialog.dismiss(status: SmartStatus.loading);
          var msg =
              ex.message.isNotEmpty ? ex.message : ApiException.defaultMessage;
          EasyLoading.showError(msg);
        } else if (ex is UnauthorisedException) {
          // 接口未认证处理
          if (GlobalService.to.isLoggedInValue &&
              GlobalService.to.token != null &&
              GlobalService.to.token!.isNotEmpty) {
            // GlobalService.to.logout();
            SmartDialog.dismiss();
            EasyLoading.dismiss();
            getx.Get.normalDialog(
                width: getx.Get.width * 0.85,
                barrierDismissible: false,
                showCancelBtn: false,
                title: '提示',
                content: '您的账号登录已失效,请重新登录',
                confirmText: '確定',
                confirmAction: () {
                  getx.Get.offAllNamed('/login');
                  SmartDialog.dismiss(status: SmartStatus.loading);
                });
          } else if (GlobalService.to.token != null) {
            // GlobalService.to.clear();
          }
        }
      } else {
        transaction.status = const SpanStatus.unknown();
      }
      return Result.failure(APIError(ex.message, ex.code));
    } catch (e, stackTrace) {
      transaction.throwable = e;
      transaction.status = const SpanStatus.unknown();

      /// 异常上报
      LoggerUtils.apiError(e, stackTrace: stackTrace);
      SmartDialog.dismiss(status: SmartStatus.loading);
      return Result.failure(APIError(ApiException.defaultMessage, -1));
    } finally {
      // 在整个请求完成后再刷新线路
      if (notAvailableList.isNotEmpty) {
        LinkUtils.endpoints = LinkUtils.endpoints
            .where((item) => !notAvailableList.contains(item))
            .toList();
      }
      // 结束事务
      await transaction.finish();
    }
  }

  /// 线路列表里面随机返回一条
  static String getRandomLine(List<dynamic> endpoints) {
    if (endpoints.isNotEmpty) {
      final random = Random();
      final randomIndex = random.nextInt(endpoints.length);
      String baseUrl = endpoints[randomIndex];
      return baseUrl;
    } else {
      return "";
    }
  }

  /// 线路列表里面随机返回一条
  static List<String> removeHttp(List<String> endpoints) {
    List<String> temp = [];
    bool status = false;
    for (String url in endpoints) {
      String result = "";
      if (url.isNotEmpty) {
        if (url.startsWith("https://")) {
          result = url.replaceFirst("https://", "");
          status = true;
        } else if (url.startsWith("http://")) {
          result = url.replaceFirst("http://", "");
          status = true;
        } else if (url.startsWith("https//")) {
          result = url.replaceFirst("https//", "");
          status = true;
        } else if (url.startsWith("http//")) {
          result = url.replaceFirst("http//", "");
          status = true;
        } else {
          result = url;
        }
      }
      temp.add(result);
    }
    if (status) {
      LoggerUtils.error(
          "获取到带头线路:${endpoints.toString()} 转化后:${temp.toString()}");
    }
    return temp;
  }

  /// 返回网络状态
  static Future<bool> checkWebsites() async {
    List<String> websites = [
      'https://www.baidu.com',
      'https://www.qq.com',
      'https://www.alibaba.com',
    ];

    // 用于存储每个请求的 Future
    List<Future<bool>> futures = [];
    // 并行发送所有请求，并记录每个请求的结果
    for (var website in websites) {
      var future = Dio()
          .get(website,
              options: Options(
                  receiveTimeout: const Duration(seconds: 3),
                  sendTimeout: const Duration(seconds: 3)))
          .then((response) {
        if (response.statusCode == 200) {
          return true;
        }
        return false;
      }).catchError((e) {
        return false;
      });

      // 单挑检测不超过3秒
      var timeoutFuture =
          future.timeout(const Duration(seconds: 3), onTimeout: () {
        return false; // 超时视为失败
      });
      futures.add(timeoutFuture);
    }
    // 等待任何一个请求完成
    var completed = await Future.wait(futures);
    // 如果任何一个请求成功，则返回true
    if (completed.contains(true)) {
      return true;
    }
    // 如果没有请求成功，则返回false
    return false;
  }

  @override
  void onInit() async {
    super.onInit();
    getUserAgent();

    /// 监听线路切换设置
    // ToolsUtils.instance.lineChangeStatus.addListener(() async {
    //   String? baseUrl = ToolsUtils.instance.isDebugModel ? LinkUtils.testBaseUrl : MySharedPref.getBaseUrl();
    //   if (baseUrl != null) {
    //     updateBaseUrl(baseUrl);
    //   }
    // });
  }

  @override
  void onClose() {
    _dio?.close();
    super.onClose();
  }
}
