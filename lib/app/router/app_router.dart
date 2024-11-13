import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../di/locator_shorten.dart';
import 'app_router.gr.dart';


@singleton
@AutoRouterConfig()
class AppRouter extends RootStackRouter implements AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (resolver.routeName == LoginRoute.name) {
      resolver.next();
    } else {
      bool isAuthenticated = AppLocator.auth.isAuthenticated();
      if (isAuthenticated) {
        debugPrint('User is authenticated. Continuing navigation');
        resolver.next();
      } else {
        debugPrint('User is not authenticated. Redirecting to login screen');
        AppLocator.router.push(const LoginRoute());
      }
    }
  }

  @override
  List<AutoRoute> get routes => [
    // AutoRoute(path: '/home', page: HomeRoute.page),
    AutoRoute(path: '/login', page: LoginRoute.page, initial: true),
    // AutoRoute(path: '/setting', page: SettingRoute.page),
    AutoRoute(path: '/register', page: RegisterRoute.page),
    AutoRoute(path: '/forgot-password', page: ForgotPasswordRoute.page)
  ];
}
