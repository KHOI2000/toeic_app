import 'package:injectable/injectable.dart';
import '../../di/locator_shorten.dart';
import '../router/app_router.gr.dart';

@singleton
class AppAuth {

  bool isAuthenticated() {
    if (AppLocator.fAuth.user != null) {
      return true;
    }
    return false;
  }

  bool isAuthenticatedAndVerified() {
    if (AppLocator.fAuth.user != null && !AppLocator.fAuth.user!.isAnonymous) {
      return true;
    }
    return false;
  }

  void logOut() async {
    await AppLocator.fAuth.signOut();
    AppLocator.router.navigate(const LoginRoute());
  }
}
