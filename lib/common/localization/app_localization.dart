import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalization{
  final Locale locale;
  late Map<String,String> _localizedValues;

  AppLocalization(this.locale);

  static AppLocalization of(BuildContext context) => Localizations.of<AppLocalization>(context, AppLocalization)!;

  Future<AppLocalization> load()async{
    String jsonStringValue = await rootBundle.loadString("assets/lang/${locale.countryCode?.toLowerCase()}.json");
    final mappedJson = json.decode(jsonStringValue) as Map<String,dynamic>;
    _localizedValues = mappedJson.map((key, dynamic value) => MapEntry(key, value.toString()));

    return this;
  }

  String tr(String key) => _localizedValues[key]!;

  static const LocalizationsDelegate<AppLocalization> delegate = _AppLocalizationDelegate();
}

class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization>{
  const _AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) =>["uz","en"].contains(locale.languageCode);

  @override
  Future<AppLocalization> load(Locale locale) async => SynchronousFuture<AppLocalization>(
    await AppLocalization(locale).load(),
  );

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalization> old) => false;
}