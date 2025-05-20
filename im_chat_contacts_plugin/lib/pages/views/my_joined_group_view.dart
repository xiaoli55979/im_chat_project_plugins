import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:im_chat_common_plugin/widget/base_view.dart';
import 'package:im_chat_contacts_plugin/pages/controllers/my_joined_group_controller.dart';

class MyJoinedGroupView extends GetView<MyJoinedGroupController> {
  const MyJoinedGroupView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BaseView(
      title: "我管理的群",
        child: Container(color: Colors.red,));
  }

}