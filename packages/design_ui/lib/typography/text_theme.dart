import 'package:design_ui/design_ui.dart';
import 'package:flutter/material.dart';

class StyleTextTheme {
  StyleTextTheme._();

  static const TextStyle _baseTextStyle = TextStyle(
    package: 'design_ui',
    fontFamily: FontFamilyTheme.mainFont,
    fontWeight: FontWeightTheme.regular,
  );

  static TextStyle get textThemeDisplayLarge {
    return _baseTextStyle.copyWith(
      fontFamily: FontFamilyTheme.mainFont,
      fontSize: FontSizeTheme.titleVeryLarge,
      fontWeight: FontWeightTheme.extraBold,
    );
  }

  static TextStyle get textThemeDisplayMedium {
    return _baseTextStyle.copyWith(
      fontFamily: FontFamilyTheme.mainFont,
      fontSize: FontSizeTheme.titleLarge,
      fontWeight: FontWeightTheme.extraBold,
    );
  }

  static TextStyle get headline2 {
    return _baseTextStyle.copyWith(
      fontSize: FontSizeTheme.titleLarge,
      fontWeight: FontWeightTheme.semiBold,
    );
  }

  static TextStyle get displayMedium {
    return _baseTextStyle.copyWith(
      fontSize: FontSizeTheme.titleLarge,
      fontWeight: FontWeightTheme.extraBold,
    );
  }

  static TextStyle get displaySmall {
    return _baseTextStyle.copyWith(
      fontSize: FontSizeTheme.titleLarge,
      fontWeight: FontWeightTheme.extraBold,
    );
  }

  static TextStyle get headlineMedium {
    return _baseTextStyle.copyWith(
      fontSize: FontSizeTheme.bodyLarge,
      fontWeight: FontWeightTheme.bold,
    );
  }

  static TextStyle get headlineSmall {
    return _baseTextStyle.copyWith(
      fontSize: FontSizeTheme.bodyLarge,
      fontWeight: FontWeightTheme.regular,
    );
  }

  static TextStyle get titleMedium {
    return _baseTextStyle.copyWith(
      fontSize: FontSizeTheme.navItemLarge,
      fontWeight: FontWeightTheme.light,
    );
  }

  static TextStyle get labelLarge {
    return _baseTextStyle.copyWith(
      fontSize: FontSizeTheme.numberLarge,
      fontWeight: FontWeightTheme.bold,
    );
  }

  static TextStyle get labelMedium {
    return _baseTextStyle.copyWith(
      fontSize: FontSizeTheme.bodyMedium,
      fontWeight: FontWeightTheme.medium,
    );
  }

  static TextStyle get labelRegular {
    return _baseTextStyle.copyWith(
      fontSize: FontSizeTheme.bodyRegular,
      fontWeight: FontWeightTheme.light,
    );
  }

  static TextStyle get labelLight {
    return _baseTextStyle.copyWith(
      fontSize: FontSizeTheme.bodyLight,
      fontWeight: FontWeightTheme.light,
    );
  }
}
