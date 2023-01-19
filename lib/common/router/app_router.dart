import 'package:check_store/common/router/route_name.dart';
import 'package:check_store/feature/screens/check_page/presentation/page/check_page.dart';
import 'package:check_store/feature/screens/home_page/presentation/page/home_page.dart';
import 'package:check_store/feature/screens/qr_code_scanner_page/presentation/page/qr_code_scanner_page.dart';
import 'package:check_store/feature/screens/sign_up_page/presentation/page/sign_up_page.dart';
import 'package:flutter/material.dart';


class AppRouter<T extends Object?> {
  const AppRouter();

  Route<T> onGenerateRoute(RouteSettings settings) {
    switch(settings.name){
      case AppRouteName.SIGN_UP_PAGE:
        return MaterialPageRoute(builder: (context) => const SignUpPage(),settings:  settings);
      case AppRouteName.HOME_PAGE:
        return MaterialPageRoute(builder: (context) => const HomePage(),settings:  settings);
      case AppRouteName.QR_CODE_SCANNER_PAGE:
        return MaterialPageRoute(builder: (context) => const QrCodeScannerPage(),settings:  settings);
      case AppRouteName.CHECK_PAGE:
        return MaterialPageRoute(builder: (context) => const CheckPage(),settings:  settings);
      default:
        return _errorRoute();
    }
  }

  Route<T> _errorRoute() => MaterialPageRoute(builder: (context) => const Scaffold(
    body: Center(
      child: Text("Error route"),
    ),
  ));
}
