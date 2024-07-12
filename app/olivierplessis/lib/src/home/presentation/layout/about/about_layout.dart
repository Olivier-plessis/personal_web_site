import 'package:design_ui/design_ui.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:olivierplessis/core/utils/extension/responsive_extension.dart';
import 'package:olivierplessis/src/home/domain/model/about/about_model.dart';
import 'package:olivierplessis/src/home/presentation/layout/about/left_about_section.dart';
import 'package:olivierplessis/src/home/presentation/layout/about/right_about_section.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AboutLayout extends ConsumerWidget {
  const AboutLayout({super.key, required this.aboutData});

  final AboutSection aboutData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextStyle titleSize = context.isDisplayLargeThanTablet
        ? StyleTextTheme.textThemeDisplayLarge.copyWith(
            fontWeight: FontWeightTheme.semiBold,
          )
        : StyleTextTheme.labelMedium;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.min,
      children: [
        ResponsiveRowColumn(
          columnMainAxisAlignment: MainAxisAlignment.center,
          columnSpacing: 24,
          rowPadding:
              EdgeInsets.fromLTRB(16.0, (kToolbarHeight + 96), 16.0, 8.0),
          layout: context.isDisplayLargeThanTablet
              ? ResponsiveRowColumnType.ROW
              : ResponsiveRowColumnType.COLUMN,
          children: [
            ResponsiveRowColumnItem(
              rowFlex: 6,
              rowFit: FlexFit.tight,
              child: LeftAboutSection(
                aboutData: aboutData,
                titleSize: titleSize,
                onTap: () {},
              ),
            ),
            ResponsiveRowColumnItem(
              rowFlex: 1,
              rowFit: FlexFit.loose,
              child: Container(
                alignment: Alignment.topRight,
                constraints: BoxConstraints(
                  minHeight: context.isDisplayLargeThanTablet ? 640 : 500,
                ),
                child: RightAboutSection(
                  aboutData: aboutData,
                  titleSize: titleSize,
                ),
              ),
            )
          ],
        )
      ],
    ).paddedHV(4, kToolbarHeight / 2);
  }
}