import 'package:flutter/material.dart';
import 'package:im_chat_common_plugin/im_chat_common_plugin_library.dart';
import 'package:im_chat_common_plugin/util/app_values.dart';
import 'package:im_chat_common_plugin/util/common_ui.dart';
import 'package:im_chat_common_plugin/util/extension.dart';
import 'package:im_chat_common_plugin/util/fonts.dart';
import 'package:im_chat_common_plugin/util/image_util.dart';
import 'package:im_chat_common_plugin/widget/button/common_button.dart';
import 'package:im_chat_common_plugin/widget/image/common_image_view.dart';
import 'package:im_chat_contacts_plugin/model/ui_contact_entity.dart';
import 'package:im_chat_common_plugin/widget/long_press_action_view.dart';
import 'package:im_chat_resource_plugin/generated/assets.dart';
import 'package:wukongimfluttersdk/entity/channel.dart';

///通讯录长按菜单
enum ContactMenu implements PopupMenuItemValue {
  setRemarks,
  sendMessage;

  @override
  String get title {
    switch (this) {
      case ContactMenu.setRemarks:
        return '设置备注';
      case ContactMenu.sendMessage:
        return '发消息';
    }
  }

  @override
  String? get image {
    switch (this) {
      case ContactMenu.setRemarks:
        return Assets.commonMenuEdit;
      case ContactMenu.sendMessage:
        return Assets.commonMenuChats;
    }
  }

  @override
  PopupMenuItem<ContactMenu> item() {
    return popupMenuItem(value: this, title: title, image: image, imageColor: LightThemeColors.bodyTextColor);
  }
}

class ContactCell extends LongPressActionView<ContactMenu> {
  ContactCell({
    super.key,
    required this.data,
    required this.action,
    required this.menuAction,
  });

  final WKChannel data;

  final void Function(WKChannel data) action;

  final void Function(WKChannel data, ContactMenu menu) menuAction;

  @override
  Widget childBuild(BuildContext context) {
    return CommonButton(
      padding: EdgeInsets.zero,
      minSize: 0,
      borderRadius: BorderRadius.zero,
      onPressed: (){
        action(data);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          children: [
            ClipOval(
              child: CommonImageView.avatar(
                imageUrl: ImageUtil.getAvatarUrl(data!!),
                width: 50,
                height: 50,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: CommonText.instance(
                          data!.channelRemark.isNotEmptyString() ? data!.channelRemark : data!.channelName,
                          fontWeight: CommonFontWeight.medium,
                          16,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      ..._buildTagView(),
                    ],
                  ),
                  if (_showSubContent())
                    const SizedBox(height: 2),
                  if (_showSubContent())
                    CommonText.instance(
                      _getSubContent(),
                      14,
                      color: LightThemeColors.listTileSubtitleColor,
                    ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }

  ///是否显示副标题
  _showSubContent(){
    final lastSeenTime = TimeToolsUtils.getOnlineTime(data!.lastOffline);
    return data!.online == 1 || (data!.lastOffline != 0 && lastSeenTime.isEmptyString());
  }

  ///副标题内容
  _getSubContent(){
    final lastSeenTime = TimeToolsUtils.getOnlineTime(data!.lastOffline);
    if (data!.online == 1) {
      return UserOnlineStatus.userOnlineStatus(data!.deviceFlag).name;
    } else if (data!.lastOffline != 0 && lastSeenTime.isEmptyString()){
      final lastTime = TimeToolsUtils.getShowDateAndMinute(data!.lastOffline * 1000);
      return '上次在线时间 $lastTime';
    }
     return '';
  }

  _buildTagView(){
    return [
      if (data!.category == WKSystemAccount.accountCategorySystem.value)
        ..._buildTag(tagName: '官方', textColor: LightThemeColors.reminderColor, borderColor: LightThemeColors.reminderColor),
      if (data!.category == WKSystemAccount.accountCategoryCustomerService.value)
        ..._buildTag(tagName: '客服', textColor: Colors.white, bgColor: LightThemeColors.primaryColor),
      if (data!.category == WKSystemAccount.accountCategoryVisitor.value)
        ..._buildTag(tagName: '访客', textColor: LightThemeColors.visitorColor, borderColor: LightThemeColors.visitorColor),
      if (data!.robot == 1)
        ..._buildTag(tagName: '机器人', textColor: Colors.white, bgColor: LightThemeColors.primaryColor),
    ];
  }

  _buildTag({required String tagName, Color? textColor, Color? borderColor, Color? bgColor}){
    return [
      const SizedBox(width: 5),
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 2, vertical: 1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: borderColor ?? Colors.transparent, width: 1),
          color: bgColor,
        ),
        child: CommonText.instance(tagName, 12, color: textColor, fontWeight: CommonFontWeight.semiBold),
      )
    ];
  }

  @override
  List<PopupMenuItem<ContactMenu>> get menuItems => ContactMenu.values.map((menu){
      return menu.item();
    }).toList();

  @override
  PopupMenuItemSelected<ContactMenu?> get handler => (ContactMenu? value) {
        if (value != null) {
          menuAction(data, value);
        }
      };

  @override
  double get maxWidth => 132;


}
