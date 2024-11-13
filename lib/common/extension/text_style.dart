import 'package:flutter/material.dart';

extension TextStyleExt on TextStyle {
  TextStyle get regular => copyWith(fontWeight: FontWeight.w400);

  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);

  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);

  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);
}
