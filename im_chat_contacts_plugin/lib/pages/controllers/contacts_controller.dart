import 'package:get/get.dart';
import 'package:wukongimfluttersdk/entity/channel_member.dart';
import 'package:wukongimfluttersdk/wkim.dart';

import '../../api/api_provider_contact.dart';

class Contact {
  final String avatar;
  final String username;
  final bool isGroup;

  Contact({required this.avatar, required this.username, required this.isGroup});
}

class ContactGroup {
  final String title;
  final List<Contact> contacts;

  ContactGroup({required this.title, required this.contacts});
}

class ContactsController extends GetxController {
  ContactsController({required this.api});
  final ApiProviderContact api;

  // 存储所有联系人分组
  var contactGroups = <ContactGroup>[];

  // 存储过滤后的联系人分组
  var filteredContactGroups = <ContactGroup>[];

  // 搜索关键词
  var searchQuery = ''.obs;

  /// 展开的分组
  int expandedGroupIndex = 2;

  @override
  void onReady() {
    super.onReady();
    listenerMembers();
    // 模拟加载数据
    loadContactData();
    // 监听搜索框变化
    ever(searchQuery, (_) => filterContacts());
  }

  void listenerMembers() {
    WKIM.shared.channelMemberManager.addOnRefreshMemberListener("contacts", (WKChannelMember member, bool status) {
      print("object_addOnRefreshMemberListener:${member.memberName}");
    });
  }

  // 模拟加载联系人和群组数据
  Future<void> loadContactData() async {
    try {
      var res = await api.friendSync();
      print("object_friendSync:${res.data!.length}");
      update();

      // contactGroups = [
      //   ContactGroup(
      //     title: '我管理的群组',
      //     contacts: [
      //       Contact(avatar: 'https://i.pravatar.cc/150?img=1', username: 'Alice', isGroup: true),
      //       Contact(avatar: 'https://i.pravatar.cc/150?img=2', username: 'Bob', isGroup: true),
      //     ],
      //   ),
      //   ContactGroup(
      //     title: '我加入的群组',
      //     contacts: [
      //       Contact(avatar: 'https://i.pravatar.cc/150?img=3', username: 'Charlie', isGroup: true),
      //       Contact(avatar: 'https://i.pravatar.cc/150?img=4', username: 'David', isGroup: true),
      //     ],
      //   ),
      //   ContactGroup(
      //     title: '联系人',
      //     contacts: [
      //       Contact(username: "Eve", avatar: "https://i.pravatar.cc/150?img=5", isGroup: false),
      //       Contact(username: "Frank", avatar: "https://i.pravatar.cc/150?img=6", isGroup: false),
      //       Contact(username: "Grace", avatar: "https://i.pravatar.cc/150?img=7", isGroup: false),
      //       Contact(username: "Henry", avatar: "https://i.pravatar.cc/150?img=8", isGroup: false),
      //       Contact(username: "Ivy", avatar: "https://i.pravatar.cc/150?img=9", isGroup: false),
      //       Contact(username: "Jack", avatar: "https://i.pravatar.cc/150?img=10", isGroup: false),
      //       Contact(username: "Kathy", avatar: "https://i.pravatar.cc/150?img=11", isGroup: false),
      //       Contact(username: "Leo", avatar: "https://i.pravatar.cc/150?img=12", isGroup: false),
      //       Contact(username: "Mia", avatar: "https://i.pravatar.cc/150?img=13", isGroup: false),
      //       Contact(username: "Noah", avatar: "https://i.pravatar.cc/150?img=14", isGroup: false),
      //       Contact(username: "Olivia", avatar: "https://i.pravatar.cc/150?img=15", isGroup: false),
      //       Contact(username: "Paul", avatar: "https://i.pravatar.cc/150?img=16", isGroup: false),
      //     ],
      //   ),
      // ];
      // filteredContactGroups = List.from(contactGroups); // 初始时显示所有数据
    } catch (e) {
      print("object_e:${e.toString()}");
    }
  }

  // 搜索功能：过滤联系人和群组
  void filterContacts() {
    if (searchQuery.value.isEmpty) {
      filteredContactGroups = List.from(contactGroups);
    } else {
      filteredContactGroups = contactGroups
          .map((group) {
            return ContactGroup(
              title: group.title,
              contacts: group.contacts.where((contact) => contact.username.contains(searchQuery.value)).toList(),
            );
          })
          .where((group) => group.contacts.isNotEmpty)
          .toList();
    }
    update(); // 更新视图
  }

  // 搜索框内容改变时触发
  void onSearchChanged(String query) {
    searchQuery.value = query;
  }

  /// 跳转到搜索页面
  void openSearch() {
    Get.toNamed('/search');
  }

  void updateExpandedGroupIndex(int index) {
    expandedGroupIndex = index;
    update();
  }
}
