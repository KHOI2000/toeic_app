import 'package:flutter/material.dart';
import '../enum/language_code.dart';

extension LocaleExt on Locale {
  LanguageCode get code {
    switch (languageCode) {
      case 'en':
        return LanguageCode.en;
      default:
        return LanguageCode.vi;
    }
  }
}
