// Copyright (c) 2022 NetEase, Inc. All rights reserved.
// Use of this source code is governed by a MIT license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'kit_client_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of KitClientLocalizations
/// returned by `KitClientLocalizations.of(context)`.
///
/// Applications need to include `KitClientLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'localization/kit_client_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: KitClientLocalizations.localizationsDelegates,
///   supportedLocales: KitClientLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the KitClientLocalizations.supportedLocales
/// property.
abstract class KitClientLocalizations {
  KitClientLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static KitClientLocalizations? of(BuildContext context) {
    return Localizations.of<KitClientLocalizations>(context, KitClientLocalizations);
  }

  static const LocalizationsDelegate<KitClientLocalizations> delegate = _KitClientLocalizationsDelegate();

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
    Locale('zh')
  ];

  /// No description provided for @tradePassword.
  ///
  /// In zh, this message translates to:
  /// **'交易密码'**
  String get tradePassword;

  /// No description provided for @auth_regist.
  ///
  /// In zh, this message translates to:
  /// **'注册'**
  String get auth_regist;

  /// No description provided for @auth_regist_agree_notice.
  ///
  /// In zh, this message translates to:
  /// **'点击注册代表您同意'**
  String get auth_regist_agree_notice;

  /// No description provided for @auth_regist_service.
  ///
  /// In zh, this message translates to:
  /// **'服务条款'**
  String get auth_regist_service;

  /// No description provided for @auth_regist_success.
  ///
  /// In zh, this message translates to:
  /// **'注册成功'**
  String get auth_regist_success;

  /// No description provided for @auth_username.
  ///
  /// In zh, this message translates to:
  /// **'用户名'**
  String get auth_username;

  /// No description provided for @auth_username_exist.
  ///
  /// In zh, this message translates to:
  /// **'该用户名已存在'**
  String get auth_username_exist;

  /// No description provided for @auth_username_hint.
  ///
  /// In zh, this message translates to:
  /// **'请输入您的用户名'**
  String get auth_username_hint;

  /// No description provided for @auth_username_not_length.
  ///
  /// In zh, this message translates to:
  /// **'用户名长度不正确'**
  String get auth_username_not_length;

  /// No description provided for @auth_username_validator.
  ///
  /// In zh, this message translates to:
  /// **'以字母开头,包含字母和数字,长度6-20个字符'**
  String get auth_username_validator;

  /// No description provided for @auth_nickname.
  ///
  /// In zh, this message translates to:
  /// **'昵称'**
  String get auth_nickname;

  /// No description provided for @auth_nickname_hint.
  ///
  /// In zh, this message translates to:
  /// **'请输入您的昵称'**
  String get auth_nickname_hint;

  /// No description provided for @auth_login_password.
  ///
  /// In zh, this message translates to:
  /// **'登录密码'**
  String get auth_login_password;

  /// No description provided for @auth_login_password_input.
  ///
  /// In zh, this message translates to:
  /// **'请输入登录密码'**
  String get auth_login_password_input;

  /// No description provided for @auth_login_passowrd_again.
  ///
  /// In zh, this message translates to:
  /// **'请再次输入登录密码'**
  String get auth_login_passowrd_again;

  /// No description provided for @auth_login_set_password.
  ///
  /// In zh, this message translates to:
  /// **'请设置您的登录密码'**
  String get auth_login_set_password;

  /// No description provided for @auth_login_password_validator.
  ///
  /// In zh, this message translates to:
  /// **'包含字母、数字，至少8个字符，最多20个字符'**
  String get auth_login_password_validator;

  /// No description provided for @auth_confirm_password.
  ///
  /// In zh, this message translates to:
  /// **'确认密码'**
  String get auth_confirm_password;

  /// No description provided for @auth_confirm_password_not_equal.
  ///
  /// In zh, this message translates to:
  /// **'两次密码输入不一致'**
  String get auth_confirm_password_not_equal;

  /// No description provided for @auth_confirm_passowrd_not_empty.
  ///
  /// In zh, this message translates to:
  /// **'确认密码不能为空'**
  String get auth_confirm_passowrd_not_empty;

  /// No description provided for @auth_login.
  ///
  /// In zh, this message translates to:
  /// **'登录'**
  String get auth_login;

  /// No description provided for @auth_line_check.
  ///
  /// In zh, this message translates to:
  /// **'线路检测'**
  String get auth_line_check;

  /// No description provided for @auth_login_with_password.
  ///
  /// In zh, this message translates to:
  /// **'手机密码登录'**
  String get auth_login_with_password;

  /// No description provided for @auth_login_with_phone.
  ///
  /// In zh, this message translates to:
  /// **'手机验证码登录'**
  String get auth_login_with_phone;

  /// No description provided for @auth_forget_username.
  ///
  /// In zh, this message translates to:
  /// **'忘记用户名'**
  String get auth_forget_username;

  /// No description provided for @auth_forget_password.
  ///
  /// In zh, this message translates to:
  /// **'忘记登陆密码'**
  String get auth_forget_password;

  /// No description provided for @auth_regist_new.
  ///
  /// In zh, this message translates to:
  /// **'注册新用户'**
  String get auth_regist_new;

  /// No description provided for @auth_connect_server.
  ///
  /// In zh, this message translates to:
  /// **'联系客服'**
  String get auth_connect_server;

  /// No description provided for @auth_passworld.
  ///
  /// In zh, this message translates to:
  /// **'密码'**
  String get auth_passworld;

  /// No description provided for @auth_passworld_hint.
  ///
  /// In zh, this message translates to:
  /// **'请输入您的密码'**
  String get auth_passworld_hint;

  /// No description provided for @auth_passworld_length.
  ///
  /// In zh, this message translates to:
  /// **'密码长度不正确'**
  String get auth_passworld_length;

  /// No description provided for @auth_verification_length.
  ///
  /// In zh, this message translates to:
  /// **'验证码长度不正确'**
  String get auth_verification_length;

  /// No description provided for @auth_phone.
  ///
  /// In zh, this message translates to:
  /// **'手机号'**
  String get auth_phone;

  /// No description provided for @auth_phone_hint.
  ///
  /// In zh, this message translates to:
  /// **'请输入手机号码'**
  String get auth_phone_hint;

  /// No description provided for @auth_phone_hint_error.
  ///
  /// In zh, this message translates to:
  /// **'手机号格式不正确'**
  String get auth_phone_hint_error;

  /// No description provided for @auth_verification_code.
  ///
  /// In zh, this message translates to:
  /// **'验证码'**
  String get auth_verification_code;

  /// No description provided for @auth_verification_code_hint.
  ///
  /// In zh, this message translates to:
  /// **'请输入验证码'**
  String get auth_verification_code_hint;

  /// No description provided for @auth_verification_get.
  ///
  /// In zh, this message translates to:
  /// **'获取验证码'**
  String get auth_verification_get;

  /// No description provided for @auth_verification_second.
  ///
  /// In zh, this message translates to:
  /// **'s后重发'**
  String get auth_verification_second;

  /// No description provided for @auth_new_device.
  ///
  /// In zh, this message translates to:
  /// **'新设备登录申请'**
  String get auth_new_device;

  /// No description provided for @auth_new_device_notice.
  ///
  /// In zh, this message translates to:
  /// **'为了保证您的账号安全，新设备登录需要进行人脸核验操作'**
  String get auth_new_device_notice;

  /// No description provided for @auth_login_account.
  ///
  /// In zh, this message translates to:
  /// **'登录账号'**
  String get auth_login_account;

  /// No description provided for @auth_login_device_name.
  ///
  /// In zh, this message translates to:
  /// **'设备名称'**
  String get auth_login_device_name;

  /// No description provided for @auth_face.
  ///
  /// In zh, this message translates to:
  /// **'人脸核验'**
  String get auth_face;

  /// No description provided for @auth_reset_password.
  ///
  /// In zh, this message translates to:
  /// **'重置密码'**
  String get auth_reset_password;

  /// No description provided for @auth_reset_password_apply.
  ///
  /// In zh, this message translates to:
  /// **'申请重置登录密码'**
  String get auth_reset_password_apply;

  /// No description provided for @auth_reset_password_nophone.
  ///
  /// In zh, this message translates to:
  /// **'如果您未绑定手机号请点这里进行申请重置'**
  String get auth_reset_password_nophone;

  /// No description provided for @auth_password_type.
  ///
  /// In zh, this message translates to:
  /// **'请选择类型'**
  String get auth_password_type;

  /// No description provided for @auth_email.
  ///
  /// In zh, this message translates to:
  /// **'邮箱'**
  String get auth_email;

  /// No description provided for @auth_email_hint.
  ///
  /// In zh, this message translates to:
  /// **'请输入邮箱'**
  String get auth_email_hint;

  /// No description provided for @auth_submit.
  ///
  /// In zh, this message translates to:
  /// **'提交'**
  String get auth_submit;

  /// No description provided for @auth_get_username.
  ///
  /// In zh, this message translates to:
  /// **'获取用户名'**
  String get auth_get_username;

  /// No description provided for @auth_name.
  ///
  /// In zh, this message translates to:
  /// **'姓名'**
  String get auth_name;

  /// No description provided for @auth_name_hint.
  ///
  /// In zh, this message translates to:
  /// **'请输入姓名'**
  String get auth_name_hint;

  /// No description provided for @auth_name_hint_error.
  ///
  /// In zh, this message translates to:
  /// **'姓名格式不正确'**
  String get auth_name_hint_error;

  /// No description provided for @auth_idcard.
  ///
  /// In zh, this message translates to:
  /// **'身份证号'**
  String get auth_idcard;

  /// No description provided for @auth_idcard_hint.
  ///
  /// In zh, this message translates to:
  /// **'请输入身份证号'**
  String get auth_idcard_hint;

  /// No description provided for @auth_idcard_hint_error.
  ///
  /// In zh, this message translates to:
  /// **'身份证格式不正确'**
  String get auth_idcard_hint_error;

  /// No description provided for @auth_receive_address.
  ///
  /// In zh, this message translates to:
  /// **'收款地址'**
  String get auth_receive_address;

  /// No description provided for @auth_receive_address_copy.
  ///
  /// In zh, this message translates to:
  /// **'收款地址复制成功!'**
  String get auth_receive_address_copy;

  /// No description provided for @auth_usernick.
  ///
  /// In zh, this message translates to:
  /// **'用户昵称:'**
  String get auth_usernick;

  /// No description provided for @auth_receive_qrcode.
  ///
  /// In zh, this message translates to:
  /// **'收款二维码'**
  String get auth_receive_qrcode;

  /// No description provided for @auth_save_photo.
  ///
  /// In zh, this message translates to:
  /// **'保存到相册'**
  String get auth_save_photo;

  /// No description provided for @auth_share_adress.
  ///
  /// In zh, this message translates to:
  /// **'分享地址'**
  String get auth_share_adress;

  /// No description provided for @auth_share_qrcode_adress.
  ///
  /// In zh, this message translates to:
  /// **'分享收款二维码'**
  String get auth_share_qrcode_adress;

  /// No description provided for @help_and_set.
  ///
  /// In zh, this message translates to:
  /// **'帮助与设置'**
  String get help_and_set;

  /// No description provided for @send.
  ///
  /// In zh, this message translates to:
  /// **'发送'**
  String get send;

  /// No description provided for @checkProtocolTips.
  ///
  /// In zh, this message translates to:
  /// **'请阅读并勾选用户协议与隐私协议'**
  String get checkProtocolTips;

  /// No description provided for @passwordFormatTips.
  ///
  /// In zh, this message translates to:
  /// **'密码必须包含英文大小写字母和数字'**
  String get passwordFormatTips;

  /// No description provided for @sms_code_verify_send_success.
  ///
  /// In zh, this message translates to:
  /// **'短信验证码发送成功'**
  String get sms_code_verify_send_success;

  /// No description provided for @auth_reset_pwd_success.
  ///
  /// In zh, this message translates to:
  /// **'重置密码成功'**
  String get auth_reset_pwd_success;

  /// No description provided for @auth_reset_pwd_failed.
  ///
  /// In zh, this message translates to:
  /// **'重置密码失败'**
  String get auth_reset_pwd_failed;

  /// No description provided for @service.
  ///
  /// In zh, this message translates to:
  /// **'服务器'**
  String get service;

  /// No description provided for @join.
  ///
  /// In zh, this message translates to:
  /// **'加入'**
  String get join;

  /// No description provided for @scanQRCodeToJoin.
  ///
  /// In zh, this message translates to:
  /// **'扫描二维码加入'**
  String get scanQRCodeToJoin;

  /// No description provided for @service_hint.
  ///
  /// In zh, this message translates to:
  /// **'请输入服务器ID'**
  String get service_hint;

  /// No description provided for @unableToReceiveVerifyCode.
  ///
  /// In zh, this message translates to:
  /// **'收不到验证码'**
  String get unableToReceiveVerifyCode;

  /// No description provided for @general.
  ///
  /// In zh, this message translates to:
  /// **'通用'**
  String get general;

  /// No description provided for @version.
  ///
  /// In zh, this message translates to:
  /// **'版本'**
  String get version;

  /// No description provided for @privacyAgreement.
  ///
  /// In zh, this message translates to:
  /// **'隐私协议'**
  String get privacyAgreement;

  /// No description provided for @userAgreement.
  ///
  /// In zh, this message translates to:
  /// **'用户协议'**
  String get userAgreement;

  /// No description provided for @uploadMalfunction.
  ///
  /// In zh, this message translates to:
  /// **'上报故障'**
  String get uploadMalfunction;

  /// No description provided for @clearLocalCache.
  ///
  /// In zh, this message translates to:
  /// **'清除本地缓存'**
  String get clearLocalCache;

  /// No description provided for @fontSize.
  ///
  /// In zh, this message translates to:
  /// **'字体大小'**
  String get fontSize;

  /// No description provided for @multilingual.
  ///
  /// In zh, this message translates to:
  /// **'多语言'**
  String get multilingual;
}

class _KitClientLocalizationsDelegate extends LocalizationsDelegate<KitClientLocalizations> {
  const _KitClientLocalizationsDelegate();

  @override
  Future<KitClientLocalizations> load(Locale locale) {
    return SynchronousFuture<KitClientLocalizations>(lookupKitClientLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_KitClientLocalizationsDelegate old) => false;
}

KitClientLocalizations lookupKitClientLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'zh': return KitClientLocalizationsZh();
  }

  throw FlutterError(
    'KitClientLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
