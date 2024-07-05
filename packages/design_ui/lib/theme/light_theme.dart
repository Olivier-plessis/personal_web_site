import 'package:design_ui/theme/color.dart';
import 'package:design_ui/typography/text_theme.dart';
import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Palette.surfaceBackgroundLight,
  colorScheme: const ColorScheme.light(
    onSurface: Palette.greyDark,
  ),
  textTheme: siteTextTheme,
  primaryTextTheme: siteTextTheme,
  appBarTheme: AppBarTheme(
    backgroundColor: Palette.surfaceBackgroundLight,
    centerTitle: false,
    titleSpacing: 64,
    scrolledUnderElevation: 4,
    shadowColor: Colors.grey.shade50.withOpacity(0.2),
    toolbarHeight: 96,
  ),
);
/*
const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF96416A),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFFFD8E6),
  onPrimaryContainer: Color(0xFF3D0024),
  secondary: Color(0xFF735761), // Color(0xFF96416A),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFFFD8E6),
  onSecondaryContainer: Color(0xFF3D0024),
  tertiary: Color(0xFF96416A),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFFFD8E6),
  onTertiaryContainer: Color(0xFF3D0024),
  error: Color(0xFFFFB0D0),
  errorContainer: Color(0xFF5C113B),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFFFFD8E6),
  surface: Color(0xFFFBFBFB),
  onSurface: Palette.greyDark,
);
*/
