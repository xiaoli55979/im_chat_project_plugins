import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:im_chat_common_plugin/config/theme/color_mycolors.dart';
import 'package:im_chat_common_plugin/tools/image_tools.dart';
import 'package:im_chat_common_plugin/util/asset_util.dart';
import 'package:im_chat_resource_plugin/generated/assets.dart';

class PersonInfoWidget extends StatelessWidget {
  const PersonInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.blue,
      child: Column(
        children: [
          Row(
            children: [
              ImageTools.asset("default_avatar.png",width: 50,height: 50, isCommon: true),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("昵称：Michael", style: TextStyle(color: Colors.white, fontSize: 14),),
                  Text("服务器ID: WWW888", style: TextStyle(color: Colors.white, fontSize: 14)),
                  Text("山行野宿孤身万里", style: TextStyle(color: Colors.white, fontSize: 14))
                ],
              ),
              Spacer(),
              SizedBox(
                width: 100,
                child: AssetUtil.asset(
                  Assets.contactMoreWhite,
                  width: 50,
                  height: 50,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
