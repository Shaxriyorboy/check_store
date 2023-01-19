import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'feature/app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  ).then(
        (_) => App.run(),
  );
}

