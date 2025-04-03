import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_chat_common_plugin/im_chat_common_plugin_library.dart';

import '../controllers/add_friends_controller.dart';

class AddFriendsView extends GetView<AddFriendsController> {
  const AddFriendsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddFriendsController>(builder: (controller) {
      return BasicView(
        title: "添加好友",
        actions: [],
        body: Column(
          children: [
            // Search bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: controller.searchController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  hintText: "搜索手机号/账号",
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
                ),
                onChanged: (value) => controller.searchUser(value),
              ),
            ),

            // My account info
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "我的账号: ${controller.myAccount}",
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: const Icon(Icons.qr_code, size: 20),
                      onPressed: controller.showQRCode,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),
              ),
            ),

            const Divider(height: 1),

            // Search results or empty state
            Expanded(
              child: controller.searchResults.isEmpty
                  ? _buildEmptyState(context)
                  : ListView.builder(
                      itemCount: controller.searchResults.length,
                      itemBuilder: (context, index) {
                        final user = controller.searchResults[index];
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(user.avatar),
                          ),
                          title: Text(user.nickname),
                          subtitle: Text("账号: ${user.account}"),
                          trailing: ElevatedButton(
                            onPressed: () => controller.addFriend(user.id),
                            child: const Text("添加"),
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

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search, size: 64, color: Colors.grey.withOpacity(0.5)),
          const SizedBox(height: 16),
          Text(
            "搜索用户账号/手机号",
            style: TextStyle(color: Colors.grey.withOpacity(0.7)),
          ),
        ],
      ),
    );
  }
}
