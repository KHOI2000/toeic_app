import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'app/config/app_vm.dart';
import 'common/constant/app_constant.dart';
import 'common/enum/theme_code.dart';
import 'di/locator.dart';
import 'di/locator_shorten.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  configureDependencies();
  ThemeCode theme = await getInitialTheme();
  Locale locale = await getInitialLocale();
  runApp(MyApp(
    theme: theme,
    locale: locale,
  ));
}

Future<ThemeCode> getInitialTheme() async {
  String? theme = await AppLocator.storage.readItem(AppConstant.themeMode);
  if (theme == 'dark') {
    return ThemeCode.dark;
  }
  return ThemeCode.light;
}

Future<Locale> getInitialLocale() async {
  String? languageCode = await AppLocator.storage.readItem(AppConstant.languageMode);
  return languageCode != null ? Locale(languageCode) : const Locale('en');
}

class MyApp extends StatelessWidget {
  final ThemeCode theme;
  final Locale locale;

  const MyApp({super.key, required this.theme, required this.locale});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<AppVM>(
              create: (context) => AppVM(
                  locale: locale,
                  // locale: const Locale('vi'),
                  themeCode: theme)),
        ],
        child: Consumer<AppVM>(
          builder: (context, vm, child) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'TOEIC-APP',
              routerConfig: AppLocator.router.config(),
              locale: vm.locale,
              theme: vm.appTheme,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: const [
                Locale('en'),
                Locale('vi')
              ],
              builder: (context, child) {
                return GestureDetector(
                  onTap: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: child!,
                );
              },
            );
          },
        ));
  }
}
