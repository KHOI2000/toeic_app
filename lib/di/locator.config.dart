// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../app/router/app_router.dart' as _i559;
import '../app/security/app_auth.dart' as _i443;
import '../plugin/firebase/f_auth.dart' as _i189;
import '../plugin/storage/local_storage.dart' as _i938;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i559.AppRouter>(() => _i559.AppRouter());
    gh.singleton<_i443.AppAuth>(() => _i443.AppAuth());
    gh.singleton<_i938.LocalStorage>(() => _i938.LocalStorage());
    gh.lazySingleton<_i189.FAuth>(() => _i189.FAuth());
    return this;
  }
}
