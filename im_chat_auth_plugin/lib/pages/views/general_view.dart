import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_chat_auth_plugin/pages/controllers/general_controller.dart';
import 'package:im_chat_common_plugin/components/menu_item.dart';
import 'package:im_chat_common_plugin/components/my_app_bar.dart';

import '../../l10n/SlocalAuth.dart';

class GeneralView extends GetView<GeneralController> {
  const GeneralView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: MyAppBar(
        title:
            Text(SlocalAuth.getLocalizaContent(SlocalAuth.of(context).general)),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          MenuItem(
              onPressed: () {
                controller.clearCache();
              },
              icon: Icons.import_contacts,
              title: SlocalAuth.getLocalizaContent(
                  SlocalAuth.of(context).clearLocalCache)),
          MenuItem(
              onPressed: () {},
              icon: Icons.import_contacts,
              title: SlocalAuth.getLocalizaContent(
                  SlocalAuth.of(context).fontSize)),
          MenuItem(
              onPressed: () {},
              icon: Icons.import_contacts,
              title: SlocalAuth.getLocalizaContent(
                  SlocalAuth.of(context).multilingual)),
        ],
      ),
    );
  }
}
