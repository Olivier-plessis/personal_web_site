import 'package:design_ui/theme/color.dart';
import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
  colorScheme: const ColorScheme.dark(
    onSurface: Palette.white,
    onPrimary: Palette.violet,
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
);
