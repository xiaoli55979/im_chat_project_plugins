import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_chat_common_plugin/im_chat_common_plugin_library.dart';
import 'package:im_chat_common_plugin/util/asset_util.dart';
import 'package:im_chat_common_plugin/util/constant.dart';
import 'package:im_chat_common_plugin/util/fonts.dart';
import 'package:im_chat_common_plugin/widget/az_listview/az_listview.dart';
import 'package:im_chat_common_plugin/widget/az_listview/index_bar.dart';
import 'package:im_chat_common_plugin/widget/base_view.dart';
import 'package:im_chat_common_plugin/widget/button/common_button.dart';
import 'package:im_chat_common_plugin/widget/status/multi_status_view.dart';
import 'package:im_chat_contacts_plugin/model/ui_contact_entity.dart';
import 'package:im_chat_contacts_plugin/pages/controllers/contacts_controller.dart';
import 'package:im_chat_contacts_plugin/routes/app_routes_contacts.dart';
import 'package:im_chat_contacts_plugin/widget/contact_cell.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:im_chat_resource_plugin/generated/assets.dart';
class ContactsView extends GetView<ContactsController> {
  const ContactsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ContactsController>(builder: (controller) {
      return BaseView(
        title: "通讯录",
        actions: _actionView(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // 搜索框
            SearchBarView(backgroundColor: CupertinoColors.systemGrey6, searchViewColor: Colors.white,  onTap: () {
            },),
            Expanded(
              child: MultiStatusView(
                currentStatus: controller.multiStatus,
                emptyActionType: EmptyActionType.text,
                child: AzListView(
                  physics: BouncingScrollPhysics(),
                  data: controller.contactList,
                  itemCount: controller.contactList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final contactEntity = controller.contactList[index];
                    if (index == 0 || index == 1) {
                      return _buildHeaderView(contactEntity);
                    }
                    return ContactCell(
                      data: contactEntity.wkChannel!,
                      action: (channel){
                        EasyLoading.showToast('点击聊天');
                        controller.toFriend();

                      },
                      menuAction: (channel, menu){
                        EasyLoading.showToast('点击${menu.title}');
                      },
                    );
                  },
                  susItemBuilder: (BuildContext context, int index) {
                    return _letterItem(controller.contactList[index]);
                  },
                  indexBarData: ['↑', '☆', ...kIndexBarData],
                  indexBarOptions: IndexBarOptions(
                    needRebuild: true,
                    ignoreDragCancel: true,
                    downTextStyle: TextStyle(fontSize: 12, color: Colors.white),
                    downItemDecoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.green),
                    indexHintWidth: 120 / 2,
                    indexHintHeight: 100 / 2,
                    indexHintDecoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(Assets.contactIcIndexBarBubbleGray, package: resourcePackageName),
                        fit: BoxFit.contain,
                      ),
                    ),
                    indexHintAlignment: Alignment.centerRight,
                    indexHintChildAlignment: Alignment(-0.25, 0.0),
                    indexHintOffset: Offset(-20, 0),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  _actionView() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        DropdownUtils.buildAddButtonDropdown(
          onChanged: (DropdownOption? newValue) {
            if (newValue == null) {
              return;
            }
            if (newValue.index == 2) {
              Get.toNamed(AppRoutesContacts.addFriends);
            } else if (newValue.index == 3) {
              ToolsUtils.onQrcodeScan();
            }
          },
        ),
      ],
    );
  }

  _buildHeaderView(UiContactEntity contactEntity){
     return CommonButton(
         padding: EdgeInsets.zero,
         minSize: 0,
         borderRadius: BorderRadius.zero,
         onPressed: (){
           EasyLoading.showToast(contactEntity.contactsHeader!.title);
           controller.toMyManagedGroup();
         },
         child: Container(
           padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
           decoration: const BoxDecoration(
             color: Colors.white,
           ),
           child: Row(
             children: [
               ClipOval(
                 child: AssetUtil.asset(
                   contactEntity.contactsHeader!.image,
                   width: 50,
                   height: 50,
                 ),
               ),
               const SizedBox(width: 10),
               Expanded(
                 child: CommonText.instance(
                   contactEntity.contactsHeader!.title,
                   fontWeight: CommonFontWeight.medium,
                   16,
                 ),
               ),
             ],
           ),
         )
     );
  }

  //拼音控件
  _letterItem(UiContactEntity contactEntity) {
    return Container(
      padding: const EdgeInsets.only(left: 15, top: 15),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      alignment: Alignment.centerLeft,
      child: CommonText.instance(contactEntity.getSuspensionTag(), 14, color: LightThemeColors.reminderColor, fontWeight: CommonFontWeight.medium),
    );
  }
}
