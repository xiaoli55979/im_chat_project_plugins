import 'package:dio/dio.dart';
import 'package:im_chat_common_plugin/api/base_api.dart';
import 'package:im_chat_common_plugin/api/im_api.dart';
import 'package:im_chat_common_plugin/api/provider/base_provider.dart';
import 'package:im_chat_common_plugin/models/channel_msg_sync_data.dart';
import 'package:im_chat_common_plugin/models/conversation_sync_data.dart';
import 'package:im_chat_common_plugin/models/global_info_entity.dart';
import 'package:im_chat_common_plugin/models/im_node_data.dart';
import 'package:im_chat_common_plugin/models/response/base_response_entity.dart';
import 'package:im_chat_common_plugin/models/response/data_list_response_data.dart';
import 'package:im_chat_common_plugin/models/response/result.dart';
import 'package:im_chat_common_plugin/models/user_info_data.dart';
import 'package:im_chat_common_plugin/models/wk_group_info_data.dart';
import 'package:im_chat_common_plugin/models/wk_user_info_data.dart';
import 'package:im_chat_common_plugin/im_chat_common_plugin_library.dart';
import 'package:im_chat_common_plugin/models/person_info_entity.dart';
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
        transaction.status =
            SpanStatus.fromHttpStatusCode(response.statusCode ?? -1);
        return duration;
      } else {
        transaction.status = const SpanStatus.unknown();
        throw Exception('线路测速结果异常');
      }
    } catch (e, stackTrace) {
      transaction.throwable = e;
      transaction.status = const SpanStatus.unknown();
      LoggerUtils.error(e, stackTrace: stackTrace,
          scopeCallback: (Scope scope) {
        scope.setTag(LogType.LINE.label, url);
      }, level: LogLevel.ERROR, type: LogType.ERROR);

      /// 本地显示
      LoggerUtils.error("Url:$url:${e.toString()}",
          error: "线路测速异常", level: LogLevel.INFO);
      return 20000; // 超时或者异常时返回默认值
    } finally {
      // 结束事务
      await transaction.finish();
    }
  }

  /// 获取用户所在的im节点信息
  Future<Result<BaseEntity<IMNodeData?>?, APIError>> getIMNode(
      {required String uid}) async {
    final url = BaseAPI.getIMNode.path.replaceAll('uid', uid);
    final result = await getRequest(
      url,
      construction: IMNodeData.fromJson,
      decoder: BaseEntity<IMNodeData>.fromJson,
    );
    return result;
  }

  /// 同步最近会话
  Future<Result<BaseEntity<ConversationSyncData?>?, APIError>>
      conversationSync({
    required int version,
    required String lastMsgSeqs,
    required String deviceUuid,
    int msgCount = 100,
  }) async {
    final url = ImApi.conversationSync.path;
    final body = {
      'version': version,
      'last_msg_seqs': lastMsgSeqs,
      'msg_count': msgCount,
      'device_uuid': deviceUuid,
    };
    final result = await postRequest(
      ImApi.conversationSync.path,
      body,
      construction: ConversationSyncData.fromJson,
      decoder: BaseEntity<ConversationSyncData>.fromJson,
    );
    return result;
  }

  /// 获取IM用户信息详情
  Future<Result<BaseEntity<WKUserInfoData?>?, APIError>> getIMUserInfo(
      {required String uid}) async {
    final url = ImApi.getIMUserInfo.path + uid;
    final result = await getRequest(
      url,
      construction: WKUserInfoData.fromJson,
      decoder: BaseEntity<WKUserInfoData>.fromJson,
    );
    return result;
  }

  /// 获取IM群组信息详情
  Future<Result<BaseEntity<WKGroupInfoData?>?, APIError>> getIMGroupInfo(
      {required String groupId}) async {
    final url = ImApi.getIMGroupInfo.path + groupId;
    final result = await getRequest(
      url,
      construction: WKGroupInfoData.fromJson,
      decoder: BaseEntity<WKGroupInfoData>.fromJson,
    );
    return result;
  }

  /// 同步频道消息
  Future<Result<BaseEntity<ChannelMsgSyncData?>?, APIError>> channelMsgSync({
    required String uid,
    required String channelID,
    required int channelType,
    required int startMsgSeq,
    required int endMsgSeq,
    required int limit,
    required int pullMode,
  }) async {
    final url = ImApi.channelMsgSync.path;
    final body = {
      "login_uid": uid, // 当前登录用户uid
      "channel_id": channelID, //  频道ID
      "channel_type": channelType, // 频道类型
      "start_message_seq": startMsgSeq, // 开始消息列号（结果包含start_message_seq的消息）
      "end_message_seq": endMsgSeq, // 结束消息列号（结果不包含end_message_seq的消息）
      "limit": limit, // 消息数量限制
      "pull_mode": pullMode // 拉取模式 0:向下拉取 1:向上拉取
    };
    final result = await postRequest(
      url,
      body,
      construction: ChannelMsgSyncData.fromJson,
      decoder: BaseEntity<ChannelMsgSyncData>.fromJson,
    );
    return result;
  }

  /// 同步消息扩展
  Future<Result<ListEntity<MessageExtra>?, APIError>> msgExtraSync({
    required String channelID,
    required int channelType,
    required int extraVersion,
    required int limit,
    required String source,
  }) async {
    final url = ImApi.msgExtraSync.path;
    final body = {
      "channel_id": channelID, //  频道ID
      "channel_type": channelType, // 频道类型
      "extra_version": extraVersion, // 开始消息列号（结果包含start_message_seq的消息）
      "limit": limit, // 结束消息列号（结果不包含end_message_seq的消息）
      "source": source, // 消息数量限制
    };
    final result = await postRequest(
      url,
      body,
      construction: MessageExtra.fromJson,
      decoder: ListEntity<MessageExtra>.fromListJson,
    );
    return result;
  }

  ///同步敏感词
  // Future<Result> prohibitWords() => getRequest(
  //       '/v1/message/prohibit_words/sync',
  //       construction: WKGroupInfoData.fromJson,
  //     decoder: BaseEntity.fromJson,
  //       decoder: (obj) => Result.fromJson(obj)
  //     );

  // /// 获取IM群组信息详情
  // Future<Result<BaseEntity<WKGroupInfoData?>?, APIError>> getIMGroupInfo(
  //     {required String groupId}) async {
  //   final url = ImApi.getIMGroupInfo.path + groupId;
  //   final result = await getRequest(
  //     url,
  //     construction: WKGroupInfoData.fromJson,
  //     decoder: BaseEntity<WKGroupInfoData>.fromJson,
  //   );
  //   return result;
  // }

  /// 拉取全局配置信息
  Future<Result<BaseEntity<GlobalInfoEntity?>?, APIError>> getGlobalConf(
      ) async {
    final url = ImApi.getGlobalConf.path;
    final result = await getRequest(
        url,
        construction: GlobalInfoEntity.fromJson,
        decoder: BaseEntity<GlobalInfoEntity>.fromJson,
      );
    return result;
  }
  /// 拉取个人配置信息
  Future<Result<BaseEntity<PersonInfoEntity?>?, APIError>> getPersonConf() => getRequest(
        ImApi.getPersonConf.path,
        decoder: BaseEntity<PersonInfoEntity>.fromJson, construction: PersonInfoEntity.fromJson
      );

  /// 获取用户信息详情
  Future<Result<BaseEntity<UserInfoData?>?, APIError>> getUserConf({
    required String uid,
  }) =>
      getRequest('${ImApi.getOwnConf.path}$uid',
          construction: UserInfoData.fromJson,
          decoder: BaseEntity<UserInfoData>.fromJson);
}
