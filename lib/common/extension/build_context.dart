import 'package:flutter/material.dart';
import '../../app/res/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension BuildContextExt on BuildContext {
  AppLocalizations get lang => AppLocalizations.of(this)!;
  TextTheme get theme => Theme.of(this).textTheme;
  AppColors get color => Theme.of(this).extension<AppColors>()!;
}
