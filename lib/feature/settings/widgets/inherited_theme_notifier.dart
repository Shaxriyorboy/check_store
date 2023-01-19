import 'package:check_store/feature/settings/widgets/theme_controller.dart';
import 'package:flutter/material.dart';

class InheritedThemeNotifier extends InheritedNotifier<ThemeController> {
  const InheritedThemeNotifier({
    required final ThemeController themeController,
    required final Widget child,
    Key? key,
  }) : super(
          key: key,
          child: child,
          notifier: themeController,
        );

  static ThemeController? maybeOf(BuildContext context, {bool listen = true}) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<InheritedThemeNotifier>()
          ?.notifier;
    } else {
      final inhW = context
          .getElementForInheritedWidgetOfExactType<InheritedThemeNotifier>()
          ?.widget;
      return inhW is InheritedThemeNotifier ? inhW.notifier : null;
    }
  }
}
