import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:im_chat_common_plugin/components/basic_view.dart';
import 'package:im_chat_common_plugin/components/main_button.dart';
import 'package:im_chat_common_plugin/components/menu_item.dart';
import 'package:im_chat_common_plugin/config/theme/color_mycolors.dart';
import 'package:im_chat_common_plugin/core/base/controllers/base_controller.dart';
import 'package:im_chat_common_plugin/l10n/SlocalUtils.dart';
import 'package:im_chat_contacts_plugin/pages/controllers/friend_info_controller.dart';
import 'package:im_chat_contacts_plugin/pages/widgets/person_info_widget.dart';

class FriendInfoView extends GetView<FriendInfoController> {
  const FriendInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicView(
        title: "好友资料",
        body: Column(
          children: [
            PersonInfoWidget(),
            MenuItem(title: "账户",
              value: "xiaomi",
              hideRightArrow: true,
              tingObject: const Icon(Icons.paste_sharp),),
            MenuItem(title: "电话", value: "xiaomi", hideRightArrow: true,),
            MenuItem(title: "邮箱", value: "xiaomi", hideRightArrow: true,),
            MenuItem(title: "备注", value: "xiaomi", hideLine: true, onPressed: () {
              controller.toRemark();
            },),
            Spacer(),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(10),
              child: MainButton(onPressed: () {

              }, text: "聊天",
                backgroundColor: Colors.blue,
              ),
            ),
            SizedBox(height: 10 + MediaQuery
                .of(context)
                .padding
                .bottom,)

          ],
        )

    );
  }

}