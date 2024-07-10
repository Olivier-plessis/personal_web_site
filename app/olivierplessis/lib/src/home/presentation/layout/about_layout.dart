import 'package:design_ui/design_ui.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:olivierplessis/core/utils/extension/responsive_extension.dart';
import 'package:olivierplessis/src/home/domain/model/about/about_model.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AboutLayout extends ConsumerWidget {
  const AboutLayout({super.key, required this.aboutData});

  final AboutSection aboutData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextStyle titleSize = context.isDisplayLargeThanTablet
        ? StyleTextTheme.headline2
        : StyleTextTheme.labelMedium;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ResponsiveRowColumn(
          columnMainAxisAlignment: MainAxisAlignment.center,
          columnSpacing: 32,
          rowSpacing: 32,
          rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
          rowCrossAxisAlignment: CrossAxisAlignment.start,
          layout: context.isDisplayLargeThanTablet
              ? ResponsiveRowColumnType.ROW
              : ResponsiveRowColumnType.COLUMN,
          children: [
            ResponsiveRowColumnItem(
              rowFlex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    aboutData.sectionTitle.toCapitalized(),
                    style: titleSize,
                  ),
                  SizedBox(height: 28.0.h),
                  Text(
                    aboutData.title.toCapitalized(),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    aboutData.subtitle.toCapitalized(),
                  ),
                ],
              ),
            ),
            ResponsiveRowColumnItem(
              rowFlex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ...aboutData.info.fold<List<Widget>>([], (widgetValue, e) {
                    final index = widgetValue.length;

                    widgetValue.add(Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ...splitAndDisplayText(e.tile),
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: RichText(
                            textAlign: TextAlign.end,
                            text: TextSpan(
                              text: '${e.value.toCapitalized()}',
                              style: titleSize.copyWith(
                                color: Palette.white,
                              ),
                              children: [
                                WidgetSpan(
                                  child: SizedBox(
                                    width: 1.0.w,
                                  ),
                                ),
                                TextSpan(
                                  text: '+',
                                  style: titleSize.copyWith(
                                    color: index == 1
                                        ? Palette.greyDark
                                        : Palette.white,
                                  ),
                                ),
                              ],
                            ),
                          ).paddedH(4),
                        ),
                      ],
                    ));
                    return widgetValue;
                  })
                ],
              ),
            ),
          ],
        )
      ],
    ).paddedHV(4, kToolbarHeight / 2);
  }

  List<Text> splitAndDisplayText(String text) {
    final words = text.split(' ');

    return words
        .map((word) => Text(
              word.toCapitalized(),
            ))
        .toList();
  }
}
