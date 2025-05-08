import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_parsed_text/flutter_parsed_text.dart';
import 'package:get/get.dart';
import 'package:im_chat_common_plugin/im_chat_common_plugin_library.dart';
import 'package:im_chat_conversation_plugin/pages/views/chat/custom_file_view.dart';
import 'package:im_chat_conversation_plugin/pages/views/chat/custom_text_view.dart';
import 'package:im_chat_conversation_plugin/pages/views/chat/multiple_bar_view.dart';
import 'package:intl/intl.dart';

import '../../handle/message_content_type.dart';
import '../controllers/chat_controller.dart';
import 'chat/custom_audio_message.dart';
import 'chat/custom_card_message.dart';
import 'chat/custom_image_message.dart';
import 'chat/custom_input.dart';
import 'chat/custom_sign_message.dart';
import 'chat/custom_unsupport_message.dart';
import 'chat/custom_video_message.dart';
import 'package:im_chat_common_plugin/l10n/SlocalUtils.dart';

class ChatView extends GetView<ChatController> {
  OverlayEntry? overlayEntry;
  ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    final sensitiveWords = ["你妈的", "揍你", "微信"];
    final sensitivePattern = sensitiveWords.map(RegExp.escape).join('|');
    return GetBuilder<ChatController>(builder: (controller) {
      return PopScope(
          canPop: false,
          onPopInvokedWithResult: (back, result) {
            if (!back) {
              Get.back();
            }
            removeOverlayEntry();
          },
          child: Scaffold(
            appBar: AppBar(
              // leading: Text("123", style: TextStyle(color: Colors.black54),),
              leadingWidth: controller.isMultiple ? 100 : 50,
              leading: controller.isMultiple ?
              Column(
                children: [
                  SizedBox(height: 20,),
                  Row(children: [
                    SizedBox(width: 10,),
                    Text("${controller.didSelectedMsgs.length}条已选中", softWrap: false, style: TextStyle(color: Colors.black),)
                  ],)
                ],
              )
                  : IconButton(onPressed: () {Get.back();}, icon: Icon(Icons.navigate_before)),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 10),
                      Expanded(
                        child:
                        Text(
                            "${controller.channelName}(1234/13441)",
                            style: TextStyle(fontSize: 16),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          )
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ],
              ),
              actions: [
                /// 占位符,使标题居中
                // SizedBox(width: 50),
                 controller.isMultiple ?
                 TextButton(onPressed: () {
                   controller.isMultiple = !controller.isMultiple;
                   controller.update();
                 }, child: Text("取消")) :
                 IconButton(
                    onPressed: () {
                      controller.gotoGroupSetting();
                      removeOverlayEntry();
                    },
                    icon: Icon(Icons.more_vert)),
              ],
            ),
            body: Chat(
              textMessageOptions: TextMessageOptions(
                isTextSelectable: false,
                openOnPreviewImageTap: true,
                openOnPreviewTitleTap: true,
                matchers: [
                  MatchText(
                    pattern: sensitivePattern,
                    style: const TextStyle(color: Colors.black),
                    renderText: ({required String str, required String pattern}) => {
                      'display': '***', // 替换成 ***
                    },
                  ),
                  MatchText(
                    pattern: r'@[\w\u4e00-\u9fa5]+',
                    style: TextStyle(
                      color: Colors.blue, // 高亮显示 @ 提及的内容
                      fontWeight: FontWeight.bold,
                    ),
                    onTap: (value) {
                      print("点击了: $value");
                    },
                  ),
                ],
                onLinkPressed: (String url) {
                  removeOverlayEntry();
                },
              ),
              theme: DefaultChatTheme(
                bubbleMargin: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 1),
                messageBorderRadius: 8,
                messageInsetsHorizontal: 10,
                messageInsetsVertical: 10,
                messageMaxWidth: MediaQuery.of(context).size.width * 0.7,
                dateDividerTextStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                dateDividerMargin: const EdgeInsets.only(top: 5, bottom: 5),
                inputTextColor: Colors.black,
                inputTextCursorColor: Colors.black,
                inputBackgroundColor: const Color(0xFFE5E5E5),
                backgroundColor: const Color(0xFFE5E5E5),
                inputElevation: 100,
                // inputBorderRadius: const BorderRadius.vertical(top: Radius.circular(5)),
                primaryColor: Colors.white,
                secondaryColor: Colors.white,
                userAvatarNameColors: [Colors.blueAccent],
                userAvatarImageBackgroundColor: Colors.blueAccent,
                userNameTextStyle: TextStyle(color: Colors.blueAccent, fontSize: 16),
                receivedMessageBodyLinkTextStyle: TextStyle(color: Colors.blue), // 接受消息里面的超链接
                sentMessageBodyTextStyle: TextStyle(color: Colors.white, fontSize: 16),
              ),
              topConfig: TopConfigOption(
                showHistory: false,
                loading: false,
                loadingColor: Theme.of(context).primaryColor,
                content: Text("加载历史消息", style: TextStyle(fontSize: 16, color: Theme.of(context).primaryColor)),
              ),
              imageGalleryOptions: ImageGalleryOptions(maxScale: 2.0, minScale: 0.5),
              scrollToUnreadOptions: ScrollToUnreadOptions(scrollOnOpen: true),
              inputOptions: InputOptions(enabled: true),
              usePreviewData: true,
              l10n: const ChatL10nZhCN(),
              timeFormat: DateFormat('HH:mm:ss'),
              dateFormat: DateFormat('yyyy-MM-dd'),
              emptyState: Text(
                "暂无消息",
                style: TextStyle(color: Colors.black),
              ),
              // showUserAvatars: widget.systemMessage ? false : true,
              // timeFormat: DateFormat('HH:mm:ss'),
              // dateFormat: DateFormat('yyyy-MM-dd'),
              // dateHeaderThreshold: widget.systemMessage ? 1800000 : 30000, // 消息时间间隔显示 分组
              // groupMessagesThreshold: widget.systemMessage ? 1800000 : 30000, // 消息分组
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              // typingIndicatorOptions: TypingIndicatorOptions(),
              emojiEnlargementBehavior: EmojiEnlargementBehavior.never,
              messages: controller.messages,
              showUserNames: true,
              showUserAvatars: true,
              isMultipleSelect: controller.isMultiple,
              isSelected: controller.isSelectedMultiple,
              selectedMsg: controller.didSelectedMsg,
              didSelectedMsgs: controller.didSelectedMsgs,
              didSelectedMsgsFun: (List<types.Message> msgs) {
                controller.didSelectedMsgs = msgs;
                print("数量是：${msgs.length}");
                controller.update();
                removeOverlayEntry();
              },
              avatarBuilder: (types.User author, bool isMultipleSelect, types.Message msg) {
                return GestureDetector(
                  onTap: () {
                    if (isMultipleSelect) {
                      controller.didSelectedMsg(msg);
                      controller.update();
                    } else {
                      controller.showUserInfo(author.id);
                    }
                    removeOverlayEntry();
                  },
                  child: Container(
                    padding: EdgeInsets.only(right: 10),
                    child:
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: ImageTools.asset("default_avatar.png", isCommon: true, width: 40, height: 40, fit: BoxFit.cover),
                    )
                    // author.imageUrl == null
                    //     ? ImageTools.asset("default_avatar.png", isCommon: true, width: 35, height: 35, fit: BoxFit.cover)
                    //     : SizedBox(
                    //         width: 30,
                    //         height: 30,
                    //         child: ClipRRect(
                    //           borderRadius: BorderRadius.circular(15), // 调整圆角
                    //           child: CachedNetworkImage(
                    //             imageUrl: author.imageUrl!,
                    //             fit: BoxFit.fill, // 让图片填充整个框
                    //             placeholder: (context, url) => Container(
                    //               width: double.infinity,
                    //               height: double.infinity,
                    //               color: Colors.grey[300], // 占位颜色
                    //             ),
                    //             errorWidget: (context, url, error) => Container(
                    //               color: Colors.grey[300],
                    //               alignment: Alignment.center,
                    //               child: Icon(Icons.error, size: 20, color: Colors.red),
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                  ),
                );
              },
              topTapCallBack: () {
                print("object_topTapCallBack");
                removeOverlayEntry();
              },
              // avatarBuilder: (types.User author) {
              //   return Container(
              //     padding: EdgeInsets.only(right: 10),
              //     child: ToolsUtils.asset("localIcons.png", width: 30, height: 30),
              //   );
              // },
              textMessageBuilder: (types.TextMessage message, {required int messageWidth, required bool showName}) {
                return CustomTextView(message: message, isOwner: controller.isOwner(message),);
            },
              videoMessageBuilder: (types.VideoMessage message, {required int messageWidth}) {
                print("<<<<<<<<<<<<<<<<<object>>>>>>>>>>>>>>>>>");
                return CustomVideoMessage(message: message, isOwner: controller.isOwner(message),);
              },
              imageMessageBuilder: (types.ImageMessage message, {required int messageWidth}) {
                return CustomImageMessage(message: message, messageWidth: 250, isOwner: controller.isOwner(message),);
              },
              customMessageBuilder: (types.CustomMessage customMessage, {required int messageWidth}) {
                final metadata = customMessage.metadata;
                int type = metadata?["type"];
                if (type == MessageContentType.CARD) {
                  return CustomCardMessage(message: customMessage, isOwner: controller.isOwner(customMessage),);
                } else if (type == MessageContentType.SIGN) {
                  return CustomSignMessage(message: customMessage, isOwner: controller.isOwner(customMessage),);
                } else {
                  return CustomUnsupportMessage();
                }
              },
              audioMessageBuilder: (types.AudioMessage message, {required int messageWidth}) {
                return CustomAudioMessage(message: message, isOwner: controller.isOwner(message),);
              },

              fileMessageBuilder: (types.FileMessage message, {required int messageWidth}) {
                return CustomFileView(message: message, isOwner: controller.isOwner(message));
            },

              /// 消息滚动
              // onMessageVisibilityChanged: (types.Message message, bool visible) {
              //   messagehandleModel.markMessageAsRead(messageQueue, message);
              // },
              onMessageLongPress: (BuildContext context, message, LongPressStartDetails details) {
                // longClick(context, message, details);
                final renderBox = context.findRenderObject() as RenderBox;

                // 获取被点击视图左上角的全局位置
                // 获取视图右上角的全局坐标
                final viewRightTopOffset = renderBox.localToGlobal(Offset(renderBox.size.width, 0));
                showBubbleMenu(context,
                  viewRightTopOffset,
                  false
                );
                // removeOverlayEntry();
              },

              customBottomWidget: controller.isMultiple ?
              MultipleBarView(didSelectedCount: controller.didSelectedMsgs.length,
                total: controller.messages.length,)
                  : CustomInput(
                requestFocus: controller.requestFocus,
                focusChange: controller.focusChange,
                onSendPressed: controller.handleSendPressed,
                onAttachmentPressedIndex: controller.handleToolsPressed,
                repliedMessage: controller.isReply ? controller.messages.first : controller.quotedMessage,
                isReplied: controller.isReply,
                onAudioValueChanged: controller.handleToolsAudioSend,
              ),
              onAttachmentPressedIndex: controller.handleToolsPressed,
              onMessageTap: controller.handleMessageTap,
              onPreviewDataFetched: controller.handlePreviewDataFetched,
              onSendPressed: controller.handleSendPressed,
              onEndReached: () async {
                print("object_onEndReached");
                removeOverlayEntry();
              },
              onAvatarTap: (types.User user) {
                print("object_onAvatarTap");
                Get.toNamed(AppRoutesCommon.userInfo);
                removeOverlayEntry();
              },
              onBackgroundTap: () {
                print("object_onBackgroundTap");
                controller.backgroundTap();
                removeOverlayEntry();
                // if (mounted) {
                //   setState(() {});
                // }
              },
              user: controller.getUser(),
            ),
          ));
    });
  }

  void showBubbleMenu(BuildContext context, Offset offset, bool isLeft) {
    removeOverlayEntry();
    print('View Offset: $offset');
    print('Context: ${context.widget}');
    final screenWidth = MediaQuery.of(context).size.width;

    // 动态计算位置
    double? leftPosition = isLeft ? offset.dx - 20 : null;
    double? rightPosition = isLeft ? null : 60;
    double topPosition = offset.dy - 140;

    // 确保不会超出屏幕
    if (leftPosition != null && leftPosition < 0) leftPosition = 0;
    if (rightPosition != null && rightPosition < 0) rightPosition = 0;
    if (topPosition < 0) topPosition = 0;
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: topPosition,
        left: leftPosition,
        right: rightPosition,
        child: BubbleView(
          viewOffset: offset,
          isLeft: isLeft,
          onDismiss: () {
            removeOverlayEntry();
          },
          menuItems: [
            MultipleItemEnum('assets/icons/reply.png', SlocalCommon.getLocalizaContent(
                SlocalCommon.of(context).reply)),
            MultipleItemEnum('assets/icons/copy.png', SlocalCommon.getLocalizaContent(
                SlocalCommon.of(context).copy)),
            MultipleItemEnum('assets/icons/forward.png', SlocalCommon.getLocalizaContent(
                SlocalCommon.of(context).forward)),
            MultipleItemEnum('assets/icons/select_all.png', SlocalCommon.getLocalizaContent(
                SlocalCommon.of(context).multipleChoice)),
            MultipleItemEnum('assets/icons/delete.png', SlocalCommon.getLocalizaContent(
                SlocalCommon.of(context).delete)),
            MultipleItemEnum('assets/icons/archive.png', SlocalCommon.getLocalizaContent(
                SlocalCommon.of(context).collect)),
            MultipleItemEnum('assets/icons/push_pin.png', SlocalCommon.getLocalizaContent(
                SlocalCommon.of(context).top)),
            MultipleItemEnum('assets/icons/more.png', SlocalCommon.getLocalizaContent(
                SlocalCommon.of(context).more)),
          ],
          didSelectItem: (MultipleItemEnum item) {
            print("你点击了${item.label}");
            controller.isMultiple = !controller.isMultiple;
            controller.update();
          },
        ),
      ),
    );

    Overlay.of(Get.context!).insert(overlayEntry!);
  }

  void removeOverlayEntry() {
    if (overlayEntry != null) {
    overlayEntry?.remove();
    overlayEntry = null;
    }
  }
}
