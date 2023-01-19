import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';

class CheckVM extends ChangeNotifier{
  String? url;
  ScreenshotController screenshotController = ScreenshotController();
}