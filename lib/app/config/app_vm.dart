import 'package:flutter/material.dart';
import '../../common/constant/app_constant.dart';
import '../../common/enum/theme_code.dart';
import '../../di/locator_shorten.dart';

class AppVM extends ChangeNotifier {
  Locale locale;
  ThemeCode themeCode;

  AppVM({required this.locale, required this.themeCode});

  ThemeData get appTheme => themeCode.theme;

  void setLocale(Locale locale) {
    this.locale = locale;
    AppLocator.storage.writeItem(AppConstant.languageMode, locale.languageCode);
    notifyListeners();
  }

  void changeTheme()  {
    if (themeCode == ThemeCode.light) {
      themeCode = ThemeCode.dark;
    } else {
      themeCode = ThemeCode.light;
    }
    AppLocator.storage.writeItem(AppConstant.themeMode, themeCode.name);
    notifyListeners();
  }
}
