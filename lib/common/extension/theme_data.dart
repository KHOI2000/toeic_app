import 'package:flutter/material.dart';
import '../../app/res/themes.dart';
import '../enum/theme_code.dart';

extension ThemeExt on ThemeData {
  ThemeCode get code {
    if (this == lightTheme) {
      return ThemeCode.light;
    }
    return ThemeCode.dark;
  }
}
