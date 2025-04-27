import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:im_chat_common_plugin/components/main_button.dart';
import 'package:im_chat_common_plugin/components/menu_item.dart';
import 'package:im_chat_common_plugin/l10n/SlocalUtils.dart';
import 'package:im_chat_contacts_plugin/pages/controllers/friend_more_controller.dart';

class FriendMoreView extends GetView<FriendMoreController> {
  const FriendMoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          SlocalCommon.getLocalizaContent(SlocalCommon.of(context).more),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          MenuItem(
              title: SlocalCommon.getLocalizaContent(
                  SlocalCommon.of(context).shareBusinessCard),
                  onPressed: () {
                controller.toShare();
                  },
          ),
          MenuItem(
              title: SlocalCommon.getLocalizaContent(
                  SlocalCommon.of(context).report),
              onPressed: () {
                controller.toReport();
              },
            ),
          MenuItem(
            title: SlocalCommon.getLocalizaContent(
                SlocalCommon.of(context).messageWithoutInterruption),
            tingObject: Obx(() {
              return Switch(
                  activeColor: Colors.blue,  // 开启状态的背景色
                  inactiveTrackColor: Colors.grey,  // 关闭状态的轨道颜色
                  inactiveThumbColor: Colors.white,  // 关闭状态的指示器颜色
                  thumbColor: WidgetStateProperty.all(Colors.white),  // 开启状态的指示器颜色
                  value: controller.isOn.value, onChanged: (value) {
                    controller.isOn.value = value;
              });
            }),
            hideRightArrow: true,
            hideLine: true,
          ),
          Spacer(),
          Padding(padding: EdgeInsets.all(16),
          child: MainButton(
              backgroundColor: Colors.red,
              onPressed: () {}, text: SlocalCommon.getLocalizaContent(SlocalCommon.of(context).deleteFriend)),
          ),
          SizedBox(
            height: MediaQuery.of(context).padding.bottom + 10,
          )
        ],
      ),
    );
  }
}
