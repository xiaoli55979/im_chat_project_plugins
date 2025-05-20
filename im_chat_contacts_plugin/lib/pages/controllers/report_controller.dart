import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:im_chat_common_plugin/core/base/controllers/base_controller.dart';
import 'package:im_chat_common_plugin/l10n/SlocalUtils.dart';

class ReportController extends BaseController {
  final reasonStrings = [
    SlocalCommon.getLocalizaContent(
        SlocalCommon.of(Get.context!).gambling),
    SlocalCommon.getLocalizaContent(
        SlocalCommon.of(Get.context!).pornographicAndVulgar),
    SlocalCommon.getLocalizaContent(
        SlocalCommon.of(Get.context!).violentTerrifyingBloody),
    SlocalCommon.getLocalizaContent(
        SlocalCommon.of(Get.context!).postingPoliticalRumors),
    SlocalCommon.getLocalizaContent(
        SlocalCommon.of(Get.context!).postingInappropriateContent),
    SlocalCommon.getLocalizaContent(
        SlocalCommon.of(Get.context!).fraudulentBehaviorOfDefraudingMoney),
    SlocalCommon.getLocalizaContent(
        SlocalCommon.of(Get.context!).accountMayHaveBeenHacked),
    SlocalCommon.getLocalizaContent(
        SlocalCommon.of(Get.context!).infringementBehaviorExists),
    SlocalCommon.getLocalizaContent(
        SlocalCommon.of(Get.context!).publishCounterfeitProductInformation),
    SlocalCommon.getLocalizaContent(
        SlocalCommon.of(Get.context!).pretendingToBeSomeoneElse),
  ];
  var selectedIndex = 100.obs; // 当前选中的索引（100 表示未选中）

  TextEditingController describeController = TextEditingController();
  final describeText = "".obs;
}