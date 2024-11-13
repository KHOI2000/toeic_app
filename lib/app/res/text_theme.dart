
import 'package:flutter/material.dart';

class AppTextTheme {
  final TextStyle s10;
  final TextStyle s12;
  final TextStyle s13;
  final TextStyle s14;
  final TextStyle s18;
  final TextStyle s16;
  final TextStyle s20;
  final TextStyle s24;
  final TextStyle s28;
  final TextStyle s32;
  final TextStyle s34;
  final TextStyle s36;
  final TextStyle s40;

  const AppTextTheme({
    required this.s10,
    required this.s12,
    required this.s13,
    required this.s14,
    required this.s16,
    required this.s18,
    required this.s20,
    required this.s24,
    required this.s28,
    required this.s32,
    required this.s34,
    required this.s36,
    required this.s40,
  });

  factory AppTextTheme.create(Color color) {
    return AppTextTheme(
      s10: TextStyle(
        fontSize: 10,
        color: color,
      ),
      s12: TextStyle(
        fontSize: 12,
        color: color,
      ),
      s13: TextStyle(
        fontSize: 13,
        color: color,
      ),
      s14: TextStyle(
        fontSize: 14,
        color: color,
      ),
      s16: TextStyle(
        fontSize: 16,
        color: color,
      ),
      s18: TextStyle(
        fontSize: 18,
        color: color,
      ),
      s20: TextStyle(fontSize: 20, color: color),
      s24: TextStyle(
        fontSize: 24,
        color: color,
      ),
      s28: TextStyle(fontSize: 28, color: color),
      s32: TextStyle(
        fontSize: 32,
        color: color,
      ),
      s34: TextStyle(
        fontSize: 34,
        color: color,
      ),
      s36: TextStyle(
        fontSize: 36,
        color: color,
      ),
      s40: TextStyle(fontSize: 40, color: color),
    );
  }
}
