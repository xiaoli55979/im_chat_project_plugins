import 'package:get/get_navigation/src/root/internacionalization.dart';

import 'chinese_language.dart';
import 'english_language.dart';

const kAppName = 'app_name'; // 应用名称
const kChangeLanguage = 'change_language'; // 切换语言
const kLanguageFollowSystem = 'language_follow_system'; // 跟随系统语言

///common
const kCommonEmptyDes = 'common_empty_des';
const kCommonCancel = 'common_cancel';
const kCommonSubmit = 'common_submit';
const kConfirm = 'confirm';

const kLaunchWelcomeDes = 'luanch_welcome_des';
const kSecurityCodeTitle = 'security_code_title';
const kSecurityCodeHintText = 'security_code_hint_text';


class Language extends Translations {
  @override
  Map<String, Map<String, String>> get keys => AppTranslation.translations;
}

class AppTranslation {
  static Map<String, Map<String, String>> translations = {
    'zh_CN': ChineseLanguage.decodedLanguage,
    'en_US': EnglishLanguage.decodedLanguage,
  };
}
