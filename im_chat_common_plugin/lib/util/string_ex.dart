extension StringEx on String {
  /// 是否是电话号码
  bool isGlobalPhoneNumber() {
    final RegExp globalPhoneRegExp = RegExp(r'^(?:\+|00)[1-9]\d{1,14}$');
    return globalPhoneRegExp.hasMatch(this);
  }
}