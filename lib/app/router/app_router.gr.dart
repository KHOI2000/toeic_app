// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:toeic_app/module/user/screen/forgot_password/forgot_password_screen.dart'
    as _i1;
import 'package:toeic_app/module/user/screen/login/login_screen.dart' as _i2;
import 'package:toeic_app/module/user/screen/register/register_screen.dart'
    as _i3;

/// generated route for
/// [_i1.ForgotPasswordScreen]
class ForgotPasswordRoute extends _i4.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i4.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.ForgotPasswordScreen();
    },
  );
}

/// generated route for
/// [_i2.LoginScreen]
class LoginRoute extends _i4.PageRouteInfo<void> {
  const LoginRoute({List<_i4.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.LoginScreen();
    },
  );
}

/// generated route for
/// [_i3.RegisterScreen]
class RegisterRoute extends _i4.PageRouteInfo<void> {
  const RegisterRoute({List<_i4.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.RegisterScreen();
    },
  );
}
