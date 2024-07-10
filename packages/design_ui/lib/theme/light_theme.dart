import 'package:design_ui/theme/color.dart';
import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  colorScheme: const ColorScheme.light(
    onSurface: Palette.greyDark,
  ),
  scaffoldBackgroundColor: Palette.surfaceBackgroundLight,
  appBarTheme: AppBarTheme(
    backgroundColor: Palette.surfaceBackgroundLight,
    centerTitle: false,
    titleSpacing: 64,
    scrolledUnderElevation: 4,
    shadowColor: Colors.grey.shade50.withOpacity(0.2),
    toolbarHeight: 96,
  ),
);
