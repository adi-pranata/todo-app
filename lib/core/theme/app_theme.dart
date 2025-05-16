import 'package:flutter/material.dart';
import 'package:todo_app/core/theme/app_colors.dart';
import 'package:todo_app/core/theme/extensions/brand_theme.dart';

final darkTheme = ThemeData(
  // Color Scheme
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: AppColor.primary20,
    onPrimary: AppColor.primary20,
    secondary: AppColor.primary40,
    onSecondary: AppColor.white,
    error: AppColor.alertRed,
    onError: AppColor.black,
    surface: AppColor.black,
    onSurface: AppColor.white,
  ),

  // Typography
  fontFamily: 'Roboto',
  textTheme: TextTheme(
    headlineSmall: _baseTextStyle.copyWith(fontWeight: FontWeight.w800, fontSize: 28),
    titleLarge: _baseTextStyle.copyWith(fontWeight: FontWeight.w700, fontSize: 26),
    titleMedium: _baseTextStyle.copyWith(fontWeight: FontWeight.w700, fontSize: 24),
    titleSmall: _baseTextStyle.copyWith(fontWeight: FontWeight.w700, fontSize: 20),
    bodyLarge: _baseTextStyle.copyWith(fontWeight: FontWeight.w700, fontSize: 18),
    bodyMedium: _baseTextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
    bodySmall: _baseTextStyle.copyWith(fontSize: 14),
    labelLarge: _baseTextStyle.copyWith(fontSize: 12),
    labelMedium: _baseTextStyle.copyWith(fontSize: 10),
    labelSmall: _baseTextStyle.copyWith(fontSize: 8),
  ),

  // Extensions
  extensions: {
    fallbackBrandTheme,
  },
);

final _baseTextStyle = TextStyle(color: AppColor.white, fontWeight: FontWeight.w500, height: 1.3, letterSpacing: 0);

final fallbackBrandTheme = BrandTheme(
  primary: AppColor.primary20,
  primary40: AppColor.primary40,
  secondary: AppColor.secondary
);