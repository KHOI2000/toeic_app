import 'package:flutter/material.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  final Color primary;
  final Color secondary;
  final MaterialColor neutral;
  final Color white;
  final Color error;
  final Color black;
  final Color background;
  final Color success;
  final Color blue;

  const AppColors(
      {required this.primary,
        required this.secondary,
        required this.neutral,
        required this.white,
        required this.error,
        required this.black,
        required this.background,
        required this.success,
        required this.blue});

  @override
  AppColors copyWith({
    MaterialColor? primary,
    MaterialColor? secondary,
    MaterialColor? neutral,
    MaterialColor? white,
    MaterialColor? error,
    MaterialColor? black,
    MaterialColor? background,
    Color? success,
    Color? blue,
  }) {
    return AppColors(
        primary: primary ?? this.primary,
        secondary: secondary ?? this.secondary,
        neutral: neutral ?? this.neutral,
        white: white ?? this.white,
        error: error ?? this.error,
        black: black ?? this.black,
        background: background ?? this.background,
        success: success ?? this.success,
        blue: blue ?? this.blue);
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    return this;
  }
}
