import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../api/api_provider_contact.dart';
import '../../model/user_model_entity.dart';

class AddFriendsController extends GetxController {
  AddFriendsController({required this.api});
  final ApiProviderContact api;

  final TextEditingController searchController = TextEditingController();
  String myAccount = "123456789"; // Replace with actual account
  List<UserModelEntity> searchResults = []; // Replace with your User model

  void searchUser(String query) {
    // Implement your search logic here
    // Update searchResults and call update()
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
