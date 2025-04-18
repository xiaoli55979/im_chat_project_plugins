import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../api/api_provider_contact.dart';
import '../../model/user_model_entity.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class AddFriendsController extends GetxController {
  AddFriendsController({required this.api});
  final ApiProviderContact api;

  final TextEditingController searchController = TextEditingController();
  String myAccount = "123456789"; // Replace with actual account
  List<UserModelEntity> searchResults = []; // Replace with your User model

  searchUser(String value) async {
    // Implement your search logic here
    // Update searchResults and call update()
    EasyLoading.show();
    try {
      final result = await api.searchFriend(
        keyword: value,
      );
      EasyLoading.dismiss();
    } catch (e) {
      EasyLoading.showToast('获取数据失败', dismissOnTap: true);
    }
  }

  void showQRCode() {}

  void addFriend(String userId) {
    // Implement add friend logic
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
