import 'package:flutter/material.dart';
import 'package:movie_review/utils/theme/appbar_theme_config.dart';
import 'package:movie_review/utils/theme/color_scheme_config.dart';
import 'package:movie_review/utils/theme/text_theme_config.dart';

class ThemeConfig {
  ThemeConfig._();

  static final darkThemeConfig = ThemeData(
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: ColorSchemeConfig.darkColorScheme,
    textTheme: TextThemeConfig.darkTextTheme,
    appBarTheme: AppbarThemeConfig.darkAppbarThemeConfig,
    fontFamily: "Manrope",
  );
}
