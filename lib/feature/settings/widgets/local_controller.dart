import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum LangCode { uz, en }

String _spLocalKey = "app_local";

class LocalController extends ChangeNotifier {
  LocalController() : _appLocal = "uz" {
    SharedPreferences.getInstance().then(
      (sp) {
        final appLocal = sp.getString(_spLocalKey);
        if (appLocal != null && appLocal.isNotEmpty) {
          _appLocal = appLocal;
          notifyListeners();
        }
      },
    );
  }

  Locale get appLocal =>
      _appLocal == "uz" ? const Locale("uz", "UZ") : const Locale("en", "EN");

  String _appLocal;

  void changeLocal(LangCode langCode) {
    _appLocal = langCode.name;

    SharedPreferences.getInstance().then(
      (sp) {
        sp.setString(_spLocalKey, _appLocal);
      },
    );
    notifyListeners();
  }
}
