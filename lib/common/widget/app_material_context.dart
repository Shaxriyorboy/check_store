import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../../feature/settings/widgets/inherited_local_notifier.dart';
import '../../feature/settings/widgets/inherited_theme_notifier.dart';
import '../../feature/settings/widgets/local_controller.dart';
import '../../feature/settings/widgets/theme_controller.dart';
import '../localization/app_localization.dart';
import '../router/app_router.dart';
import '../router/route_name.dart';

class AppMaterialContext extends StatefulWidget {
  const AppMaterialContext({Key? key}) : super(key: key);

  @override
  State<AppMaterialContext> createState() => _AppMaterialContextState();
}

class _AppMaterialContextState extends State<AppMaterialContext> {
  final localController = LocalController();
  final themeController = ThemeController();
  final router = const AppRouter();

  @override
  Widget build(BuildContext context) {
    return InheritedThemeNotifier(
      themeController: themeController,
      child: InheritedLocalNotifier(
        localController: localController,
        child: Builder(
          builder: (context) {
            return MaterialApp(
              title: 'My Friend',
              supportedLocales: const [
                Locale('uz', 'UZ'),
                Locale('en', 'En'),
              ],
              localizationsDelegates: const [
                AppLocalization.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              localeResolutionCallback: (final deviceLocale, final supportedLocales) {
                final local = InheritedLocalNotifier.maybeOf(context, listen: false)!;

                for (final locale in supportedLocales) {
                  if (locale.languageCode == local.appLocal.languageCode) {
                    return local.appLocal;
                  }
                }
                for (final locale in supportedLocales) {
                  if (deviceLocale == locale) {
                    return deviceLocale;
                  }
                }

                local.changeLocal(LangCode.uz);

                return const Locale('uz', 'UZ');
              },
              initialRoute: AppRouteName.HOME_PAGE,
              debugShowCheckedModeBanner: false,
              onGenerateRoute: router.onGenerateRoute,
              builder: (context, child) => MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                child: ScrollConfiguration(
                  behavior: const ScrollBehavior(),
                  child: child ?? const Scaffold(),
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}
