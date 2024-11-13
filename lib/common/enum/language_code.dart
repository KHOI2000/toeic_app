
import 'package:flutter/cupertino.dart';
import 'package:toeic_app/common/extension/build_context.dart';

enum LanguageCode {
  en,
  vi;

  Locale get locale {
    switch (this) {
      case LanguageCode.en:
        return const Locale('en');
      case LanguageCode.vi:
        return const Locale('vi');
    }
  }

  String title(BuildContext context) {
    switch (this) {
      case LanguageCode.en:
        return context.lang.english;
      case LanguageCode.vi:
        return context.lang.vietnamese;
    }
  }
}
