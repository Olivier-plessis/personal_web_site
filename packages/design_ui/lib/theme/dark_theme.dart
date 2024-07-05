import 'package:design_ui/theme/color.dart';
import 'package:design_ui/typography/text_theme.dart';
import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
  colorScheme: const ColorScheme.dark(
    onSurface: Palette.white,
  ),
  scaffoldBackgroundColor: Palette.surfaceBackgroundDark,
  appBarTheme: AppBarTheme(
    backgroundColor: Palette.surfaceBackgroundDark,
    centerTitle: false,
    titleSpacing: 64,
    scrolledUnderElevation: 4,
    shadowColor: Colors.grey.shade50.withOpacity(0.2),
    toolbarHeight: 96,
  ),
  textTheme: siteTextTheme,
  // primaryTextTheme: siteTextTheme,
);
/*
const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFF96416A),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFFFD8E6),
  onPrimaryContainer: Color(0xFF3D0024),
  secondary: Color(0xFF735761), // Color(0xFF96416A),
  onSecondary: Color(0xFF000000),
  secondaryContainer: Color(0xFFFFD8E6),
  onSecondaryContainer: Color(0xFF3D0024),
  tertiary: Color(0xFF96416A),
  onTertiary: Color(0xFF000000),
  tertiaryContainer: Color(0xFFFFD8E6),
  onTertiaryContainer: Color(0xFF3D0024),
  error: Color(0xFFFFB0D0),
  errorContainer: Color(0xFF5C113B),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFFFFD8E6),
  surface: Color(0xFF000000),
  onSurface: Palette.violet,
);
*/
