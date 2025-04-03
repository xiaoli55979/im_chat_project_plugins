import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_chat_common_plugin/components/basic_view.dart';
import 'package:im_chat_common_plugin/components/main_button.dart';

import '../../tools/snack_bar_util.dart';
import '../controllers/user_info_controller.dart';

class UserInfoView extends GetView<UserInfoController> {
  const UserInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserInfoController>(builder: (controller) {
      return BasicView(
        // title: controller.pageName,
        backGroundColor: Colors.white,
        body: Column(
          children: [
            _buildHeader(context),
            Expanded(child: _buildInfoList()),
            _buildBottomButtons(),
          ],
        ),
      );
    });
  }

  Size get preferredSize => Size.fromHeight(kToolbarHeight + MediaQueryData.fromView(WidgetsBinding.instance.window).padding.top);

  Widget _buildHeader(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Theme.of(context).primaryColor, Theme.of(context).primaryColor.withValues(alpha: 0.6)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Get.back();
                  },
                ),
                Text(
                  "好友资料",
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.more_vert, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage("https://i.pravatar.cc/80"),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "用户名",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "服务器ID: gc8888",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "中国式现代化，民生为大。对民生的关切，深深嵌印在总书记的足迹里。2024年，习近平总书记多次赴地方考察，强调优先抓好民生领域各项改革，着力解决人民群众急难愁盼问题。新春伊始，记者循着总书记的足迹，来到住房和城乡建设部完整社区建设十大案例之一的重庆市九龙坡区谢家湾街道民主村社区。一起来看看这里的发展和变化。",
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                          height: 1.4,
                        ),
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  Widget _buildInfoList() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      children: [
        _buildInfoRow("名称", "大军", showCopy: true),
        _buildInfoRow("账号", "aku123456", showCopy: true),
        const SizedBox(height: 24),
        _buildInfoRow(
          "电话",
          "123-456-7890",
        ),
        _buildInfoRow("邮箱", "user@example.com"),
        _buildInfoRow(
          "备注",
          "中国式现代化，民生为大。对民生的关切，深深嵌印在总书记的足迹里。2024年，习近平总书记多次赴地方考察，强调优先抓好民生领域各项改革，着力解决人民群众急难愁盼问题。新春伊始，记者循着总书记的足迹，来到住房和城乡建设部完整社区建设十大案例之一的重庆市九龙坡区谢家湾街道民主村社区。一起来看看这里的发展和变化。",
        ),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value, {bool showCopy = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade200,
            width: 1,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    value,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (showCopy)
                  IconButton(
                    icon: const Icon(Icons.copy, size: 20),
                    color: Colors.blue,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () {
                      SnackBarUtil.showSuccess("复制成功", "$label: $value");
                    },
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButtons() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: MainButton(
                  onPressed: () {
                    Get.toNamed("/chat");
                  },
                  text: "聊天"),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: MainButton(onPressed: () {}, text: "语音通话"),
            ),
          ],
        ),
      ),
    );
  }
}
