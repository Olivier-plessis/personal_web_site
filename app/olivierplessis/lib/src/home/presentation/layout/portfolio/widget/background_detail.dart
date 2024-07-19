import 'package:design_ui/design_ui.dart';
import 'package:flutter/material.dart';

Positioned backgroundDetail(
    {required double offset, required String? coverImage}) {
  return Positioned.fill(
    child: Opacity(
      opacity: 1 - ((offset >= 0.0 && offset <= 1.0) ? offset : 0),
      child: Container(
        foregroundDecoration: BoxDecoration(
          backgroundBlendMode: BlendMode.srcOver,
          gradient: Palette.tealGradient,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              coverImage ?? '',
              package: 'design_ui',
            ),
          ),
        ),
      ),
    ),
  );
}
