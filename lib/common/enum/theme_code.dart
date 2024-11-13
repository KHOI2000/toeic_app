import 'package:flutter/material.dart';
import '../../app/res/themes.dart';

enum ThemeCode {
  light,
  dark;

  ThemeData get theme {
    switch (this) {
      case ThemeCode.light:
        return lightTheme;
      case ThemeCode.dark:
        return darkTheme;
    }
  }
}
