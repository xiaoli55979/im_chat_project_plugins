extension StringEx on String {
  /// 是否是国际电话号码 008618111112222
  bool isGlobalPhoneNumber() {
    final RegExp globalPhoneRegExp = RegExp(r'^(?:\+|00)[1-9]\d{1,14}$');
    return globalPhoneRegExp.hasMatch(this);
  }
  /// 是否是电话号码 china
  bool isChinaPhoneNumber() {
    final RegExp globalPhoneRegExp = RegExp(r'^[1-9]\d{1,12}$');
    return globalPhoneRegExp.hasMatch(this);
  }

}