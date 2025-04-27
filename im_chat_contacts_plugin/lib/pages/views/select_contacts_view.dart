import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:im_chat_common_plugin/l10n/SlocalUtils.dart';
import 'package:im_chat_common_plugin/tools/image_tools.dart';
import 'package:im_chat_common_plugin/widget/base_view.dart';
import 'package:im_chat_contacts_plugin/pages/controllers/select_contacts_controller.dart';

class SelectContactsView extends GetView<SelectContactsController> {
  const SelectContactsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
        title: SlocalCommon.getLocalizaContent(
            SlocalCommon.of(context).selectFriends),
        child: Column(
          children: [
            // 顶部搜索框
            Container(
              color: CupertinoColors.systemGrey6,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: SlocalCommon.getLocalizaContent(
                        SlocalCommon.of(context).search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
            ),
            // 最近聊天部分
            SizedBox(
              height: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top -
                  MediaQuery.of(context).padding.bottom -
                  50 -
                  56 -
                  60 -
                  // 60 -
                  40, // 固定高度
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.recentChats.length,
                      itemBuilder: (context, index) {
                        final friend = controller.recentChats[index];
                        return GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: (){
                            controller.toggleFriendSelection(friend);
                          },
                          child: ListTile(
                            leading: ClipRRect(
                                borderRadius: BorderRadius.circular(26),
                                child: ImageTools.asset("default_avatar.png", isCommon: true, width: 52, height: 52)),
                            title: Text(friend),
                            trailing: Obx(() {
                              return Icon(
                                controller.selectedFriends.value
                                    .contains(friend)
                                    ? Icons.check_circle
                                    : Icons.radio_button_unchecked,
                                color: controller.selectedFriends.value
                                    .contains(friend)
                                    ? Colors.blue
                                    : null,
                              );
                            }),

                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              width: double.infinity,
              height: 60,
              child: Row(
                children: [
                  // 滚动已选择的好友
                  SizedBox(
                      width: MediaQuery.of(context).size.width - 90 - 20,
                      height: 60,
                      child:
                      // Text("data")
                      Obx(() {
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.selectedFriends.value.length,
                            itemBuilder: (contex, index) {
                              final friend = controller.selectedFriends[index];
                              return Container(
                                height: 60,
                                padding: const EdgeInsets.all(4.0),
                                child:
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(26),
                                    child: ImageTools.asset("default_avatar.png", isCommon: true, width: 52, height: 52)),
                              );
                            });
                      })),
                  // 确定部分
                  Container(
                    color: Colors.white,
                    height: 40,
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 90,
                      color: Colors.blue,
                      child: TextButton(onPressed: () {
                        // 确定按钮的点击逻辑
                      }, child: Obx(() {
                        return Text(
                          '确定${controller.selectedFriends.value.length}/50',
                          style: TextStyle(color: Colors.white),
                        );
                      })),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
