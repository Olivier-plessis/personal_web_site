import 'package:design_ui/design_ui.dart';
import 'package:flutter/material.dart';

List<Text> splitAndDisplayText(String text) {
  final words = text.split(' ');

  return words
      .map((word) => Text(
            word.toCapitalized(),
            style: StyleTextTheme.labelMedium.copyWith(color: Palette.grey),
          ))
      .toList();
}
