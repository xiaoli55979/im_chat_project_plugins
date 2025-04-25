// Copyright (c) 2022 NetEase, Inc. All rights reserved.
// Use of this source code is governed by a MIT license that can be
// found in the LICENSE file.



// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'kit_common_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class KitCommonLocalizationsZh extends KitCommonLocalizations {
  KitCommonLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appName => '';

  @override
  String get welcome => '欢迎使用';

  @override
  String get inputPassword => '请输入您的安全码';

  @override
  String get inputPasswordHit => '请输入您的安全码';

  @override
  String get defaultPassword => '默认密码是:';

  @override
  String get confirm => '确定';

  @override
  String get loginDeviceManager => '登录设备管理';

  @override
  String get friendInfo => '好友资料';

  @override
  String get more => '更多';

  @override
  String get shareBusinessCard => '分享名片';

  @override
  String get report => '举报';

  @override
  String get messageWithoutInterruption => '消息免打扰';

  @override
  String get deleteFriend => '删除好友';
}
