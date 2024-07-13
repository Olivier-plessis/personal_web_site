import 'package:design_ui/theme/color.dart';
import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
  primaryColor: Palette.white,
  colorScheme: const ColorScheme.dark(
    onSurface: Palette.white,
    onPrimary: Palette.violet,
  ),
  scaffoldBackgroundColor: Palette.surfaceBackgroundDark,
  appBarTheme: AppBarTheme(
    scrolledUnderElevation: 0,
    elevation: 0,
    backgroundColor: Palette.surfaceBackgroundDark.withOpacity(0.9),
    centerTitle: false,
    titleSpacing: 6,
    shadowColor: Colors.grey.shade50.withOpacity(0.8),
  ),
);
