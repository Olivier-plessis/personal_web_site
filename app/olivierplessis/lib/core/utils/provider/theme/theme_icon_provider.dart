import 'package:flutter/material.dart';
import 'package:olivierplessis/core/utils/provider/theme/theme_mode_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_icon_provider.g.dart';

@riverpod
IconData themeModeIcon(ThemeModeIconRef ref) {
  final currentThemeMode = ref.watch(themeModeControllerProvider);
  return currentThemeMode == ThemeMode.light
      ? Icons.dark_mode
      : Icons.light_mode;
}
