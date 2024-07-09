import 'package:design_ui/design_ui.dart';
import 'package:flutter/material.dart';

class StyleTextTheme {
  StyleTextTheme._();

  static const TextStyle _baseTextStyle = TextStyle(
    package: 'design_ui',
    fontFamily: FontFamilyTheme.mainFont,
    fontWeight: FontWeightTheme.regular,
  );

  static TextStyle get TextThemeDisplayLarge {
    return _baseTextStyle.copyWith(
      fontFamily: FontFamilyTheme.mainFont,
      fontSize: FontSizeTheme.titleVeryLarge.sp,
      fontWeight: FontWeightTheme.extraBold,
    );
  }

  static TextStyle get TextThemeDisplayMedium {
    return _baseTextStyle.copyWith(
      fontFamily: FontFamilyTheme.mainFont,
      fontSize: FontSizeTheme.titleLarge.spMax,
      fontWeight: FontWeightTheme.extraBold,
    );
  }

  static TextStyle get headline2 {
    return _baseTextStyle.copyWith(
      fontSize: FontSizeTheme.titleLarge.sp,
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
      fontSize: FontSizeTheme.titleLarge.sp,
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
      fontSize: FontSizeTheme.bodyLarge.sp,
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
      fontWeight: FontWeightTheme.light,
    );
  }
}

/*
final siteTextTheme = TextTheme(
  displayLarge: StyleTextTheme.TextThemeDisplayLarge,
  displayMedium: StyleTextTheme.displayMedium,
  displaySmall: StyleTextTheme.displaySmall,
  headlineMedium: StyleTextTheme.headlineMedium,
  headlineSmall: StyleTextTheme.headlineSmall,
  titleMedium: StyleTextTheme.titleMedium,
  labelMedium: StyleTextTheme.labelMedium,
);
*/
