enum ImApi {
  conversationSync('/v1/conversation/sync'),

  channelMsgSync('/v1/message/channel/sync'),

  msgExtraSync('/v1/message/extra/sync'),

  getIMUserInfo('/v1/user/?uid='),

  getIMGroupInfo('/v1/groups/');

  const ImApi(this.path);

  final String path;
}