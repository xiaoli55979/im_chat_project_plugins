import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_chat_common_plugin/components/basic_view.dart';
import 'package:im_chat_common_plugin/components/search_bar_view.dart';
import 'package:im_chat_common_plugin/widget/base_view.dart';
import 'package:im_chat_contacts_plugin/pages/controllers/my_managed_group_controller.dart';

class MyManagedGroupView extends GetView<MyManagedGroupController> {
  const MyManagedGroupView({super.key});

  @override
  Widget build(BuildContext context) {
   return GetBuilder<MyManagedGroupController>(builder: (controller) {
    return BasicView(
      backGroundColor: CupertinoColors.systemGrey2,
        title: "我管理的群",
        actions: [],
        body: Column(
          children: [
            // 搜索框
            Container(
              color: CupertinoColors.systemGrey2,
              child: SearchBarView(backgroundColor: Colors.grey, searchViewColor: Colors.white,)
              ,),

            _groupListView(context),

          ],
   ));
  });}

  Widget _groupListView(BuildContext context) {
    print("<<<<<<<<<<<<<<<<<<<<<<<<<${MediaQuery.of(context).padding.top}>>>>>>>>>>>>>>>>>>>>>>>>>");
    print("<<<<<<<<<<<<<<<<<<<<<<<<<<${MediaQuery.of(context).padding.bottom}>>>>>>>>>>>>>>>>>>>>>>>>>>");
    final itemCount = 3;
    return Container(
      color: CupertinoColors.systemGrey2,
      height: MediaQuery.of(context).size.height - 56 - 70 - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom,
      child: ListView.builder(
          itemCount: itemCount,
          itemBuilder: (context, index) {
            return Container(
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      SizedBox(width: 10,),
                      Container(
                        color: Colors.grey,
                        width: 30,
                        height: 30,
                      ),
                      SizedBox(width: 10,),
                      Text("昵称", style: TextStyle(color: Colors.black54, fontSize: 15),),
                      Spacer(),
                      SizedBox(width: 10,)
                    ],
                  ),
                  SizedBox(height: 10,),
                  Visibility(
                    visible: index != itemCount - 1,
                    child: Divider(),),
                  Visibility(
                      visible: index == itemCount - 1,
                      child: Container(
                        width: double.infinity,
                        height: 40,
                        color: CupertinoColors.systemGrey2,
                        child: Center(
                          child: Text("20个群组", style: TextStyle(color: Colors.black45),),
                        ),
                      )),
                ],
              ),
            );
          }),
    );
  }
}