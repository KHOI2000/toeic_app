import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app/config/app_vm.dart';
import '../app/res/res.dart';
import '../app/router/app_router.dart';
import '../app/security/app_auth.dart';
import '../plugin/firebase/f_auth.dart';
import '../plugin/storage/local_storage.dart';
import 'locator.dart';

class AppLocator {
  static AppRouter get router => locator<AppRouter>();

  static BuildContext get context => router.navigatorKey.currentContext!;

  static TextTheme get theme => Theme.of(context).textTheme;

  static AppColors get color => Theme.of(context).extension<AppColors>()!;

  static LocalStorage storage = locator<LocalStorage>();

  static AppAuth get auth => locator<AppAuth>();

  static FAuth get fAuth => locator<FAuth>();

  static AppVM get appVM => Provider.of<AppVM>(context, listen: false);
}
