import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_chat_common_plugin/im_chat_common_plugin_library.dart';
import 'package:im_chat_contacts_plugin/pages/controllers/report_controller.dart';

class ReportView extends GetView<ReportController> {
  const ReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
              SlocalCommon.getLocalizaContent(SlocalCommon.of(context).report)),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height - 56 - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom,
          color: CupertinoColors.systemGrey6,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            children: [
              Text(
                SlocalCommon.getLocalizaContent(
                    SlocalCommon.of(context).reportingObject),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
       SizedBox(height: 10),
              _reportingObjectWidget(),
              SizedBox(height: 10),
              Text(
                SlocalCommon.getLocalizaContent(SlocalCommon.of(context).reason),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              _reasonWidget(context),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    SlocalCommon.getLocalizaContent(
                        SlocalCommon.of(context).certificate),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    "0/6",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              _certificateWidget(),
              SizedBox(
                height: 10,
              ),
              Text(
                SlocalCommon.getLocalizaContent(
                    SlocalCommon.of(context).describe),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10,),
              _describeWidget(context),
              SizedBox(height: 20,),
              MainButton(backgroundColor: Colors.blue, onPressed: (){}, text: SlocalCommon.getLocalizaContent(SlocalCommon.of(context).save)),
              SizedBox(height: 20 + MediaQuery.of(context).padding.bottom,)
            ],
          ),
        ),
      ),
    );
  }

  Widget _reportingObjectWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Colors.white),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: ImageTools.asset("default_avatar.png",
                  width: 60, height: 60, fit: BoxFit.cover, isCommon: true),
            ),
          ),
          SizedBox(
            width: 6,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "招商总局(官方)",
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              SizedBox(
                height: 14,
              ),
              Text("zhaoshang",
                  style: TextStyle(fontSize: 12, color: Colors.grey))
            ],
          ),
          Spacer()
        ],
      ),
    );
  }

  Widget _reasonWidget(BuildContext context) {
    return Container(
        height: 350,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: ListView.builder(
              itemCount: controller.reasonStrings.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    controller.selectedIndex.value = index;
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 10,left: 10,right: 10,bottom: 0),
                    child: Row(
                      children: [
                        Text(
                          controller.reasonStrings[index],
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        Spacer(),
                        // Icon(Icons.check_box )
                        Obx(() {
                          return Icon(controller.selectedIndex.value == index ? Icons.check_box : Icons.check_box_outline_blank);
                        })
                      ],
                    ),
                  ),
                );
        }));
  }

  Widget _certificateWidget() {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Icon(Icons.add, weight: 80,),
    );
  }

  Widget _describeWidget(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Obx(() {
        return Stack(
          children: [
            TextField(
              textAlignVertical: TextAlignVertical.top,
              expands: true,
              controller: controller.describeController,
              maxLength: 128,
              maxLines: null,
              onChanged: (text) {
                controller.describeText.value = text;
              },
              decoration: InputDecoration(
                hintText: SlocalCommon.getLocalizaContent(SlocalCommon.of(context).enter), // 设置占位文字
                filled: true,
                counterText: "",
                fillColor: Colors.white,
                // suffixIcon:
                // IconButton(
                //   icon: Icon(Icons.clear),
                //   onPressed: () {
                //     controller.describeController.text = "";
                //     controller.describeText.value = "";
                //   },
                // ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            Positioned(
                bottom: 10,
                right: 10,
                child: Text(
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                    "${controller.describeText.value.length}/128"))
          ],
        );
      }),
    );
  }
}
