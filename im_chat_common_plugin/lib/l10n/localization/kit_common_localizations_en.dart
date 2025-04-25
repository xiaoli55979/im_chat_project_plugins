// Copyright (c) 2022 NetEase, Inc. All rights reserved.
// Use of this source code is governed by a MIT license that can be
// found in the LICENSE file.



// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'kit_common_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class KitCommonLocalizationsEn extends KitCommonLocalizations {
  KitCommonLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => '';

  @override
  String get welcome => 'Welcome to ';

  @override
  String get inputPassword => 'Please enter your security id';

  @override
  String get inputPasswordHit => 'Please enter your id';

  @override
  String get defaultPassword => 'The default id is:';

  @override
  String get confirm => 'Confirm';

  @override
  String get loginDeviceManager => 'Log in to device management';

  @override
  String get friendInfo => 'friendData';

  @override
  String get more => 'More';

  @override
  String get shareBusinessCard => 'share businessCard';

  @override
  String get report => 'report';

  @override
  String get messageWithoutInterruption => 'message without interruption';

  @override
  String get deleteFriend => 'Delete Friend';
}
