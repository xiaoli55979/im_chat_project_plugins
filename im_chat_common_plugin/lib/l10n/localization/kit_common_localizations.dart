// Copyright (c) 2022 NetEase, Inc. All rights reserved.
// Use of this source code is governed by a MIT license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'kit_common_localizations_en.dart';
import 'kit_common_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of KitCommonLocalizations
/// returned by `KitCommonLocalizations.of(context)`.
///
/// Applications need to include `KitCommonLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'localization/kit_common_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: KitCommonLocalizations.localizationsDelegates,
///   supportedLocales: KitCommonLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the KitCommonLocalizations.supportedLocales
/// property.
abstract class KitCommonLocalizations {
  KitCommonLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static KitCommonLocalizations? of(BuildContext context) {
    return Localizations.of<KitCommonLocalizations>(context, KitCommonLocalizations);
  }

  static const LocalizationsDelegate<KitCommonLocalizations> delegate = _KitCommonLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('zh')
  ];

  /// No description provided for @appName.
  ///
  /// In zh, this message translates to:
  /// **''**
  String get appName;

  /// No description provided for @welcome.
  ///
  /// In zh, this message translates to:
  /// **'欢迎使用'**
  String get welcome;

  /// No description provided for @inputPassword.
  ///
  /// In zh, this message translates to:
  /// **'请输入您的安全码'**
  String get inputPassword;

  /// No description provided for @inputPasswordHit.
  ///
  /// In zh, this message translates to:
  /// **'请输入您的安全码'**
  String get inputPasswordHit;

  /// No description provided for @defaultPassword.
  ///
  /// In zh, this message translates to:
  /// **'默认密码是:'**
  String get defaultPassword;

  /// No description provided for @confirm.
  ///
  /// In zh, this message translates to:
  /// **'确定'**
  String get confirm;

  /// No description provided for @loginDeviceManager.
  ///
  /// In zh, this message translates to:
  /// **'登录设备管理'**
  String get loginDeviceManager;

  /// No description provided for @friendInfo.
  ///
  /// In zh, this message translates to:
  /// **'好友资料'**
  String get friendInfo;

  /// No description provided for @more.
  ///
  /// In zh, this message translates to:
  /// **'更多'**
  String get more;

  /// No description provided for @shareBusinessCard.
  ///
  /// In zh, this message translates to:
  /// **'分享名片'**
  String get shareBusinessCard;

  /// No description provided for @report.
  ///
  /// In zh, this message translates to:
  /// **'举报'**
  String get report;

  /// No description provided for @messageWithoutInterruption.
  ///
  /// In zh, this message translates to:
  /// **'消息免打扰'**
  String get messageWithoutInterruption;

  /// No description provided for @deleteFriend.
  ///
  /// In zh, this message translates to:
  /// **'删除好友'**
  String get deleteFriend;

  /// No description provided for @reportingObject.
  ///
  /// In zh, this message translates to:
  /// **'举报对象'**
  String get reportingObject;

  /// No description provided for @reason.
  ///
  /// In zh, this message translates to:
  /// **'理由'**
  String get reason;

  /// No description provided for @certificate.
  ///
  /// In zh, this message translates to:
  /// **'凭证'**
  String get certificate;

  /// No description provided for @describe.
  ///
  /// In zh, this message translates to:
  /// **'说明'**
  String get describe;

  /// No description provided for @gambling.
  ///
  /// In zh, this message translates to:
  /// **'赌博'**
  String get gambling;

  /// No description provided for @pornographicAndVulgar.
  ///
  /// In zh, this message translates to:
  /// **'色情低俗'**
  String get pornographicAndVulgar;

  /// No description provided for @violentTerrifyingBloody.
  ///
  /// In zh, this message translates to:
  /// **'暴恐血腥'**
  String get violentTerrifyingBloody;

  /// No description provided for @postingPoliticalRumors.
  ///
  /// In zh, this message translates to:
  /// **'发布政治谣言'**
  String get postingPoliticalRumors;

  /// No description provided for @postingInappropriateContent.
  ///
  /// In zh, this message translates to:
  /// **'发布不适当内容'**
  String get postingInappropriateContent;

  /// No description provided for @fraudulentBehaviorOfDefraudingMoney.
  ///
  /// In zh, this message translates to:
  /// **'存在欺诈骗钱行为'**
  String get fraudulentBehaviorOfDefraudingMoney;

  /// No description provided for @accountMayHaveBeenHacked.
  ///
  /// In zh, this message translates to:
  /// **'账号可能被盗用'**
  String get accountMayHaveBeenHacked;

  /// No description provided for @infringementBehaviorExists.
  ///
  /// In zh, this message translates to:
  /// **'存在侵权行为'**
  String get infringementBehaviorExists;

  /// No description provided for @publishCounterfeitProductInformation.
  ///
  /// In zh, this message translates to:
  /// **'发布仿冒品信息'**
  String get publishCounterfeitProductInformation;

  /// No description provided for @pretendingToBeSomeoneElse.
  ///
  /// In zh, this message translates to:
  /// **'冒充他人'**
  String get pretendingToBeSomeoneElse;

  /// No description provided for @enter.
  ///
  /// In zh, this message translates to:
  /// **'请输入'**
  String get enter;

  /// No description provided for @save.
  ///
  /// In zh, this message translates to:
  /// **'保存'**
  String get save;
}

class _KitCommonLocalizationsDelegate extends LocalizationsDelegate<KitCommonLocalizations> {
  const _KitCommonLocalizationsDelegate();

  @override
  Future<KitCommonLocalizations> load(Locale locale) {
    return SynchronousFuture<KitCommonLocalizations>(lookupKitCommonLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_KitCommonLocalizationsDelegate old) => false;
}

KitCommonLocalizations lookupKitCommonLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return KitCommonLocalizationsEn();
    case 'zh': return KitCommonLocalizationsZh();
  }

  throw FlutterError(
    'KitCommonLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
