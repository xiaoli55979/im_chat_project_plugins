import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:im_chat_common_plugin/im_chat_common_plugin_library.dart';

class ScreenShotView extends StatelessWidget {
  final String describeText;
  const ScreenShotView({super.key, required this.describeText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 60,
      height: MediaQuery.of(context).size.width - 60,
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: Column(
        children: [
          SizedBox(
            height: 60,
            child: Center(child: Text(SlocalCommon.getLocalizaContent(SlocalCommon.of(context).tips), style: TextStyle(color: CupertinoColors.black, fontSize: 18, fontWeight: FontWeight.w600),)),
          ),
          Expanded(child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20.0),
            child: Text(describeText,
                style: TextStyle(color: CupertinoColors.black, fontSize: 16, fontWeight: FontWeight.w400),
            textAlign: TextAlign.start,),
          )
          ),
          Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border(top: BorderSide(width: 0.5,color: Colors.grey))
            ),
            child: TextButton(onPressed: () {
              Navigator.pop(context);
            },
                child:
                Text(SlocalCommon.getLocalizaContent(SlocalCommon.of(context).confirm),
                    style:
                    TextStyle(color: Colors.blue, fontSize: 18, fontWeight: FontWeight.w600)))
          )
        ],
      ),
    );
  }
}
