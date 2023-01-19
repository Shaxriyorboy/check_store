import 'package:check_store/common/style/text_style.dart';
import 'package:flutter/material.dart';
import 'colors.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData light() => ThemeData(
        textTheme: AppTextStyle(),
        scaffoldBackgroundColor: AppColors.white,
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: AppColors.transparent,
        ),
        appBarTheme: const _AppBarTheme(),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.white,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          showSelectedLabels: false,
        ),
        inputDecorationTheme: const _InputDecorationTheme._(),
      );

  static ThemeData dark() => light();
}

class _AppBarTheme extends AppBarTheme {
  const _AppBarTheme();

  @override
  double? get elevation => 0;

  @override
  bool? get centerTitle => true;

  @override
  Color? get backgroundColor => AppColors.white;

  @override
  IconThemeData? get actionsIconTheme => const IconThemeData(color: AppColors.black);

  @override
  IconThemeData? get iconTheme => const IconThemeData(color:  AppColors.black);

  @override
  TextStyle? get titleTextStyle => AppTextStyle().bodyLarge;
}

class _InputDecorationTheme extends InputDecorationTheme{
  const _InputDecorationTheme._();


}