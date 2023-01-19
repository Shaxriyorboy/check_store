import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../common/widget/app_material_context.dart';
import '../common/widget/custum_screen_util.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  static void run() {
    runApp(
        const ProviderScope(
          child: App(),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return const CustomScreenUtil(
      child: AppMaterialContext(),
    );
  }
}
