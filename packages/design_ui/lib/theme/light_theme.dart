import 'package:design_ui/theme/color.dart';
import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  primaryColor: Palette.greyDark,
  colorScheme: const ColorScheme.light(
    onSurface: Palette.greyDark,
  ),
  scaffoldBackgroundColor: Palette.surfaceBackgroundLight,
  appBarTheme: AppBarTheme(
    scrolledUnderElevation: 0,
    elevation: 0,
    centerTitle: false,
    titleSpacing: 6,
    shadowColor: Colors.grey.shade50.withOpacity(0.8),
    backgroundColor: Palette.surfaceBackgroundLight.withOpacity(0.9),
    toolbarHeight: 96,
  ),
);
