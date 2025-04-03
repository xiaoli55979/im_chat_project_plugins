import 'dart:ui';

extension ColorExtension on Color {
  Color get bgTitleColor {
    return this..withOpacity(0.8);
  }
}
