import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_chat_common_plugin/im_chat_common_plugin_library.dart';

import '../../routes/app_routes_contacts.dart';
import '../controllers/contacts_controller.dart';

class ContactsView extends GetView<ContactsController> {
  const ContactsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ContactsController>(builder: (controller) {
      return BasicView(
        title: "通讯录",
        actions: [
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
          const SizedBox(width: 10),
        ],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // 搜索框
            const SearchBarView(),
            // 展开分组
            Expanded(
              child: ListView.builder(
                itemCount: controller.filteredContactGroups.length,
                itemBuilder: (context, index) {
                  final group = controller.filteredContactGroups[index];
                  return Container(
                    color: Colors.white,
                    child: ExpansionTile(
                      title: Text(
                        group.title,
                        style: const TextStyle(fontSize: 17),
                      ),
                      initiallyExpanded: index == controller.expandedGroupIndex,
                      onExpansionChanged: (isExpanded) {
                        if (isExpanded) {
                          controller.updateExpandedGroupIndex(index); // 展开的分组索引
                        } else {
                          controller.updateExpandedGroupIndex(-1); // 折叠所有分组
                        }
                      },
                      children: group.contacts
                          .asMap()
                          .map((i, contact) {
                            // 检查是否是最后一个联系人，最后一个联系人不添加分割线
                            return MapEntry(
                              i,
                              Column(
                                children: [
                                  ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage: NetworkImage(contact.avatar),
                                    ),
                                    title: Text(
                                      contact.username,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    onTap: () {
                                      // 点击联系人，跳转到联系人详情页
                                      print("Tapped on ${contact.username}");
                                      if (contact.isGroup) {
                                        Get.toNamed("/chat");
                                      } else {
                                        Get.toNamed(AppRoutesCommon.userInfo);
                                      }
                                    },
                                  ),
                                  // 如果不是最后一个联系人才添加分割线
                                  if (i != group.contacts.length - 1) DividerView(),
                                ],
                              ),
                            );
                          })
                          .values
                          .toList(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
