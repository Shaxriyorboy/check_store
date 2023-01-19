import 'package:check_store/common/localization/app_localization.dart';
import 'package:flutter/material.dart';

extension MyWords on Words{
  String tr(BuildContext context , [int? key]) => AppLocalization.of(context).tr("$name${key??" "}");
}

enum Words{
  name,
  welcome,
}