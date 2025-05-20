import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:im_chat_auth_plugin/l10n/slocal_auth.dart';
import 'package:im_chat_auth_plugin/pages/controllers/help_set_controller.dart';
import 'package:im_chat_auth_plugin/routes/app_routes_auth.dart';
import 'package:im_chat_common_plugin/components/menu_item.dart';
import 'package:im_chat_common_plugin/components/my_app_bar.dart';

class HelpSetView extends GetView<HelpSetController> {
  const HelpSetView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: MyAppBar(
        title: Text(SlocalAuth.getLocalizaContent(SlocalAuth.of(context).help_and_set)),
      ),
      body: Column(
        children: [
          SizedBox(height: 10,),
          MenuItem(onPressed: () {},icon:Icons.import_contacts, title: SlocalAuth.getLocalizaContent(SlocalAuth.of(context).unableToReceiveVerifyCode)),
          SizedBox(height: 10,),
          MenuItem(onPressed: () {
            controller.toGeneral();
          },icon:Icons.import_contacts, title: SlocalAuth.getLocalizaContent(SlocalAuth.of(context).general)),
          MenuItem(onPressed: () {},icon:Icons.import_contacts, title: SlocalAuth.getLocalizaContent(SlocalAuth.of(context).version)),
          MenuItem(onPressed: () {},icon:Icons.import_contacts, title: SlocalAuth.getLocalizaContent(SlocalAuth.of(context).privacyAgreement)),
          MenuItem(onPressed: () {},icon:Icons.import_contacts, title: SlocalAuth.getLocalizaContent(SlocalAuth.of(context).userAgreement)),
          MenuItem(onPressed: () {
            Get.toNamed(AppRoutesAuth.reportMalfunction);
          },icon:Icons.import_contacts, title: SlocalAuth.getLocalizaContent(SlocalAuth.of(context).uploadMalfunction)),
        ],
      ),
    );
  }

}