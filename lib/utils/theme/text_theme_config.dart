import 'package:flutter/material.dart';
import 'package:movie_review/utils/theme/color_scheme_config.dart';

class TextThemeConfig {
  TextThemeConfig._();

  static final darkTextTheme = TextTheme(
    labelSmall: const TextStyle().copyWith(fontSize: 8, color: ColorSchemeConfig.darkColorScheme.onPrimary, fontWeight: FontWeight.bold),
    labelMedium: const TextStyle().copyWith(fontSize: 10, color: ColorSchemeConfig.darkColorScheme.onPrimary, fontWeight: FontWeight.normal),
    labelLarge: const TextStyle().copyWith(fontSize: 12, color: ColorSchemeConfig.darkColorScheme.onPrimary, fontWeight: FontWeight.w500),

    bodySmall: const TextStyle().copyWith(fontSize: 12, color: ColorSchemeConfig.darkColorScheme.onPrimary, fontWeight: FontWeight.bold),
    bodyMedium: const TextStyle().copyWith(fontSize: 14, color: ColorSchemeConfig.darkColorScheme.onPrimary, fontWeight: FontWeight.normal),
    bodyLarge: const TextStyle().copyWith(fontSize: 16, color: ColorSchemeConfig.darkColorScheme.onPrimary, fontWeight: FontWeight.w700),

    titleSmall: const TextStyle().copyWith(fontSize: 16, color: ColorSchemeConfig.darkColorScheme.onPrimary, fontWeight: FontWeight.bold),
    titleMedium: const TextStyle().copyWith(fontSize: 18, color: ColorSchemeConfig.darkColorScheme.onPrimary, fontWeight: FontWeight.normal),
    titleLarge: const TextStyle().copyWith(fontSize: 20, color: ColorSchemeConfig.darkColorScheme.onPrimary, fontWeight: FontWeight.w600),

    headlineSmall: const TextStyle().copyWith(fontSize: 20, color: ColorSchemeConfig.darkColorScheme.onPrimary, fontWeight: FontWeight.bold),
    headlineMedium: const TextStyle().copyWith(fontSize: 22, color: ColorSchemeConfig.darkColorScheme.onPrimary, fontWeight: FontWeight.normal),
    headlineLarge: const TextStyle().copyWith(fontSize: 24, color: ColorSchemeConfig.darkColorScheme.onPrimary, fontWeight: FontWeight.w700),

    displaySmall: const TextStyle().copyWith(fontSize: 28, color: ColorSchemeConfig.darkColorScheme.onPrimary, fontWeight: FontWeight.bold),
    displayMedium: const TextStyle().copyWith(fontSize: 33, color: ColorSchemeConfig.darkColorScheme.onPrimary, fontWeight: FontWeight.normal),
    displayLarge: const TextStyle().copyWith(fontSize: 38, color: ColorSchemeConfig.darkColorScheme.onPrimary, fontWeight: FontWeight.w500),
  );
}