import 'package:flutter/material.dart';
import '../../app/res/text_theme.dart';
import '../../di/locator_shorten.dart';

extension TextThemeExt on TextTheme {
  AppTextTheme get textThemePrimary =>
      AppTextTheme.create(AppLocator.color.primary);
  AppTextTheme get textThemeSecondary =>
      AppTextTheme.create(AppLocator.color.secondary);
  AppTextTheme get textThemeWhite =>
      AppTextTheme.create(AppLocator.color.white);
  AppTextTheme get textThemeSuccess =>
      AppTextTheme.create(AppLocator.color.success);
  AppTextTheme get textThemeError =>
      AppTextTheme.create(AppLocator.color.error);
  AppTextTheme get textThemeDisable => AppTextTheme.create(Colors.grey);
  AppTextTheme get textThemeNeutral =>
      AppTextTheme.create(AppLocator.color.neutral);
  AppTextTheme get textThemeNeutralFaded =>
      AppTextTheme.create(AppLocator.color.neutral.shade600);
}
