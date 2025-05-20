import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:im_chat_common_plugin/l10n/SlocalUtils.dart';
import 'package:im_chat_common_plugin/tools/image_tools.dart';
import 'package:im_chat_common_plugin/widget/base_view.dart';
import 'package:im_chat_conversation_plugin/pages/controllers/chat_file_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ChatFileView extends GetView<ChatFileController> {

  const ChatFileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
        title:
            SlocalCommon.getLocalizaContent(SlocalCommon.of(context).chatFiles),
        actions: TextButton(
            onPressed: () {
              controller.isMultiple.value = !controller.isMultiple.value;
            },
            child: Text(SlocalCommon.getLocalizaContent(
                SlocalCommon.of(context).select))),
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

            // 时间排序部分
            Container(
              color: Colors.white,
              height: 50,
              child: Row(
                children: [
                  SizedBox(
                    width: 8,
                  ),
                  TextButton(
                      onPressed: () {
                        controller.isChronological.value =
                            !controller.isChronological.value;
                      },
                      child: Text(
                        SlocalCommon.getLocalizaContent(
                            SlocalCommon.of(context).sortByTime),
                        style: TextStyle(color: Colors.black87, fontSize: 14),
                      )),
                  SizedBox(
                    width: 4,
                  ),
                  Obx(() {
                    return controller.isChronological.value
                        ? Icon(Icons.arrow_drop_down)
                        : Icon(Icons.arrow_drop_up);
                  }),
                  Expanded(child: Obx(() {
                    return Text(
                      "${controller.selectedFiles.value.length}/${controller.files.value.length}",
                      textAlign: TextAlign.end,
                    );
                  })),
                  SizedBox(
                    width: 8,
                  )
                ],
              ),
            ),

            // 文件列表部分
            Expanded(
              // child: NestedScrollView(headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              //   return <Widget>[];
              // }, body: ),
              child: SmartRefresher(
                controller: controller.refreshController,
                onRefresh: controller.onRefresh,
                onLoading: controller.onLoading,
                enablePullUp: true,
                enablePullDown: true,
                child:
                ListView.builder(
                  itemCount: controller.files.value.length,
                  itemBuilder: (context, index) {
                    final file = controller.files[index];
                    return GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          controller.toggleFileSelection(file);
                        },
                        child: Container(
                          color: Colors.white,
                          // height: 70,
                          child: Column(
                            children: [
                              Row(children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Obx(() {
                                  return Visibility(
                                      visible: controller.isMultiple.value,
                                      child: Icon(controller
                                          .selectedFiles.value
                                          .contains(file)
                                          ? Icons.check_circle_outline
                                          : Icons.check_circle));
                                }),
                                Obx(() {
                                  return Visibility(
                                      visible: controller.isMultiple.value,
                                      child: SizedBox(
                                        width: 20,
                                      ));
                                }),
                                Icon(
                                  Icons.circle,
                                  weight: 40,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "1.docx",
                                              style: TextStyle(
                                                  color: Colors.black87,
                                                  fontSize: 14),
                                            ),
                                            Text(
                                              "我发送的文件",
                                              style: TextStyle(
                                                  color: Colors.black87,
                                                  fontSize: 14),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "23.0 kb",
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 14),
                                                ),
                                                Text(
                                                  "17:56",
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 14),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                SizedBox(
                                  width: 10,
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      SlocalCommon.getLocalizaContent(
                                          SlocalCommon.of(context)
                                              .downloaded),
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 14),
                                    )),
                                SizedBox(
                                  width: 10,
                                ),
                              ]),
                              SizedBox(
                                height: 10,
                              ),
                              Visibility(
                                  visible: index !=
                                      controller.files.value.length - 1,
                                  child: Divider(
                                    color: Colors.grey,
                                    thickness: 0.5,
                                    indent: 90,
                                  ))
                            ],
                          ),
                        ));
                  },
                ),
              )
            ),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border:
                      Border(top: BorderSide(color: Colors.black12, width: 1))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      SlocalCommon.getLocalizaContent(
                          SlocalCommon.of(context).deleteCache),
                      style: TextStyle(color: Colors.black87, fontSize: 14),
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 20,
                    color: Colors.black12,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      SlocalCommon.getLocalizaContent(
                          SlocalCommon.of(context).clear),
                      style: TextStyle(color: Colors.black87, fontSize: 14),
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 20,
                    color: Colors.black12,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Obx(() {
                      return Text(
                          style: TextStyle(color: Colors.black87, fontSize: 14),
                          "${SlocalCommon.getLocalizaContent(SlocalCommon.of(context).forward)} "
                          "(${controller.selectedFiles.value.length}/"
                          "${controller.files.value.length})");
                    }),
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            )
          ],
        ));
  }
}
