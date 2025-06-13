import 'package:dio/dio.dart';
import 'package:im_chat_common_plugin/api/provider/base_provider.dart';
import 'package:im_chat_common_plugin/api/result.dart';
import 'package:im_chat_common_plugin/models/app_config_model_entity.dart';
import 'package:im_chat_common_plugin/models/app_model_entity.dart';
import 'package:im_chat_common_plugin/models/im_node_model_entity.dart';
import 'package:im_chat_common_plugin/tools/logger_utils.dart';
import 'package:sentry_dio/sentry_dio.dart';
import 'package:sentry_flutter/sentry_flutter.dart';


/// =============用户相关接口===============
class UserProvider extends BaseProvider {
  /// 获取线路连接状态
  static Future<int> getLinkDelayTime(String link) async {
    String url = "$link/health";
    Dio dio = Dio();

    // 添加异常上报处理
    dio.addSentry();

    // 启动事务
    final transaction = Sentry.startTransaction(
      link,
      "线路测速Dio",
      bindToScope: true, // 绑定到 Sentry 作用域
    );

    try {
      var startTime = DateTime.now();

      var response = await Future.any([
        dio.get(
          url,
          options: Options(
            sendTimeout: const Duration(seconds: 7),
            receiveTimeout: const Duration(seconds: 7),
          ),
        ),
        Future.delayed(const Duration(seconds: 3), () => null), // 3秒超时
      ]);

      var endTime = DateTime.now(); // 记录结束时间

      if (response != null && response.data == true) {
        var duration = endTime.difference(startTime).inMilliseconds; // 计算时长
        transaction.status = SpanStatus.fromHttpStatusCode(response.statusCode ?? -1);
        return duration;
      } else {
        transaction.status = const SpanStatus.unknown();
        throw Exception('线路测速结果异常');
      }
    } catch (e, stackTrace) {
      transaction.throwable = e;
      transaction.status = const SpanStatus.unknown();
      LoggerUtils.error(e, stackTrace: stackTrace, scopeCallback: (Scope scope) {
        scope.setTag(LogType.LINE.label, url);
      }, level: LogLevel.ERROR, type: LogType.ERROR);

      /// 本地显示
      LoggerUtils.error("Url:$url:${e.toString()}", error: "线路测速异常", level: LogLevel.INFO);
      return 20000; // 超时或者异常时返回默认值
    } finally {
      // 结束事务
      await transaction.finish();
    }
  }

  /// 获取公共配置
  Future<Result<AppConfigModelEntity>> appConfig() => get(
        "/v1/common/appconfig",
        decoder: (obj) => Result<AppConfigModelEntity>.fromJson(obj),
      );

  /// 获取APP模块信息
  Future<dynamic> appModule() async {
    return get(
      "/v1/common/appmodule",
      decoder: (obj) {
        print("API 返回数据");

        if (obj is List) {
          // 确保 obj 里每个元素都是 Map
          return obj
              .where((e) => e is Map<String, dynamic>) // 过滤掉非 Map 类型的数据
              .map((e) => AppModelEntity.fromJson(e as Map<String, dynamic>))
              .toList();
        }

        print("⚠️ API 返回数据格式异常");
        return [];
      },
    );
  }

  /// 获取用户所在的im节点信息
  Future<Result<ImNodeModelEntity>> usersIm({required String uid}) => get(
        "/v1/users/$uid/im",
        decoder: (obj) => Result<ImNodeModelEntity>.fromJson(obj),
      );

  /// 同步最近会话
  // {
  //   "version": 0,
  //   "last_msg_seqs": "string",
  //   "msg_count": 0,
  //   "device_uuid": "string"
  // }
  Future<Map<String, dynamic>> conversationSync({
    required int version,
    required String lastMsgSeqs,
    int msgCount = 100,
    required String deviceUuid,
  }) =>
      post(
        '/v1/conversation/sync',
        {
          'version': version,
          'last_msg_seqs': lastMsgSeqs,
          'msg_count': msgCount,
          'device_uuid': deviceUuid,
        },
        decoder: (obj) => obj as Map<String, dynamic>, // 直接返回 JSON
      );

  /// 获取用户信息详情
  Future<Map<String, dynamic>> getUserInfo({
    required String uid,
  }) =>
      get(
        '/v1/user/?uid=$uid',
        decoder: (obj) => obj as Map<String, dynamic>,
      );

  /// 获取用户头像
  Future<Map<String, dynamic>> getUserAvatar({
    required String uid,
  }) =>
      get(
        '/v1/users/$uid/avatar',
        decoder: (obj) => obj as Map<String, dynamic>, // 直接返回 JSON
      );

  /// 获取群组信息详情
  Future<Map<String, dynamic>> getGroupInfo({
    required String groupId,
  }) =>
      get(
        '/v1/groups/$groupId',
        decoder: (obj) => obj as Map<String, dynamic>, // 直接返回 JSON
      );

  /// 获取群组头像
  Future<Map<String, dynamic>> getGroupAvatar({
    required String groupId,
  }) =>
      get(
        '/v1/groups/$groupId/avatar',
        decoder: (obj) => obj as Map<String, dynamic>, // 直接返回 JSON
      );
  //
  Future<Map<String, dynamic>> channelSync({
    required String uid,
    required String channelID,
    required int channelType,
    required int startMsgSeq,
    required int endMsgSeq,
    required int limit,
    required int pullMode,
  }) =>
      post(
        '/v1/message/channel/sync',
        {
          "login_uid": uid, // 当前登录用户uid
          "channel_id": channelID, //  频道ID
          "channel_type": channelType, // 频道类型
          "start_message_seq": startMsgSeq, // 开始消息列号（结果包含start_message_seq的消息）
          "end_message_seq": endMsgSeq, // 结束消息列号（结果不包含end_message_seq的消息）
          "limit": limit, // 消息数量限制
          "pull_mode": pullMode // 拉取模式 0:向下拉取 1:向上拉取
        },
        decoder: (obj) => obj as Map<String, dynamic>, // 直接返回 JSON
      );

  ///同步敏感词,如银行卡,微信,提示注意交易问题
  Future<Result> sensitiveWords() => get(
        '/v1/message/sync/sensitivewords',
        decoder: (obj) => Result.fromJson(obj),
      );

  ///同步敏感词
  Future<Result> prohibitWords() => get(
        '/v1/message/prohibit_words/sync',
        decoder: (obj) => Result.fromJson(obj),
      );
}
