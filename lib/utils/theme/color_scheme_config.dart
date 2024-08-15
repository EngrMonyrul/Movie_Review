import 'package:flutter/material.dart';

class ColorSchemeConfig {
  ColorSchemeConfig._();

  static const customRed = Color(0xFFE50000);
  static const whiteColor = Colors.white;
  static const customGrey = Color(0xFF999999);
  static const customBlack = Color(0xFF1A1A1A);
  static const customBlackBg = Color(0xFF141414);
  static const cutomBlackBorder = Color(0xFF262626);

  static final darkColorScheme = ColorScheme.fromSeed(
    seedColor: customRed,
    primary: customRed,
    onPrimary: whiteColor,
    secondary: customGrey,
    onSecondary: whiteColor,
    tertiary: customBlack,
    onTertiary: whiteColor,
    error: customRed,
    onError: whiteColor,
    surface: customBlackBg,
    onSurface: whiteColor,
    background: customBlackBg,
    onBackground: whiteColor,
    outline: cutomBlackBorder,
  );
}
