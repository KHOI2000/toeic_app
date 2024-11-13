import 'package:flutter/material.dart';
import 'package:toeic_app/common/extension/extension.dart';

import '../di/locator_shorten.dart';

void showToast(String message) {
  final scaffold = ScaffoldMessenger.of(AppLocator.context);
  scaffold.showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: AppLocator.theme.textThemeNeutral.s14,
      ),
      width: 400,
      behavior: SnackBarBehavior.floating,
      backgroundColor: AppLocator.color.background,
      elevation: 4,
      duration: const Duration(seconds: 2),
    ),
  );
}
