// Copyright (c) 2022 NetEase, Inc. All rights reserved.
// Use of this source code is governed by a MIT license that can be
// found in the LICENSE file.



import 'switchkit_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class SwitchkitLocalizationsZh extends SwitchkitLocalizations {
  SwitchkitLocalizationsZh([String locale = 'zh']) : super(locale);

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
}
