import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:im_chat_common_plugin/im_chat_common_plugin_library.dart';
import 'package:im_chat_common_plugin/widget/base_view.dart';

class RemarkView extends StatelessWidget {
  const RemarkView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
        title: "备注",
        child: Container(
          padding: EdgeInsets.all(20),
          color: CupertinoColors.systemGrey6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("备注名称", style: TextStyle(fontSize: 15, color: Colors.black54),textAlign: TextAlign.left,),
              SizedBox(height: 10,),
              Container(
                color: Colors.white,
                child: TextField(

                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 16),
                    hintText: '请输入备注名称',
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
              Spacer(),
              SizedBox(
                height: MediaQuery.of(context).padding.bottom + 70,
                child: MainButton(onPressed: () {}, text: "保存", backgroundColor: Colors.blue,),
              )
            ],
          ),
        ));
  }
}
