import 'package:flutter/material.dart';
import 'package:movie_review/utils/theme/color_scheme_config.dart';

class AppbarThemeConfig {
  AppbarThemeConfig._();

  static final darkAppbarThemeConfig = AppBarTheme(
    color: Colors.transparent,
    elevation: 0,
    titleTextStyle: const TextStyle().copyWith(
      color: ColorSchemeConfig.darkColorScheme.onPrimary,
    ),
    iconTheme: IconThemeData(
      color: ColorSchemeConfig.darkColorScheme.onPrimary,
    ),
  );
}
