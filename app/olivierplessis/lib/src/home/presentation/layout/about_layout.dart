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
        ? StyleTextTheme.textThemeDisplayLarge
        : StyleTextTheme.labelMedium;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.min,
      children: [
        ResponsiveRowColumn(
          columnMainAxisAlignment: MainAxisAlignment.center,
          columnSpacing: 24,
          rowPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          layout: context.isDisplayLargeThanTablet
              ? ResponsiveRowColumnType.ROW
              : ResponsiveRowColumnType.COLUMN,
          children: [
            ResponsiveRowColumnItem(
                rowFlex: 6,
                rowFit: FlexFit.tight,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: context.isDisplayLargeThanTablet ? 640 : 500,
                  ),
                  child: Stack(clipBehavior: Clip.hardEdge, children: <Widget>[
                    Positioned(
                        right: 0,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight:
                                context.isDisplayLargeThanTablet ? 640 : 500,
                          ),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: RepaintBoundary(
                              child: ImagePictureCustom(
                                path: BrandingAssets.bdgPhoto,
                              ),
                            ),
                          ),
                        )),
                    Container(
                      width: 600.0.w,
                      constraints: BoxConstraints(
                        minWidth: context.isDisplayLargeThanTablet ? 940 : 500,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            aboutData.sectionTitle.toCapitalized(),
                            style: titleSize.copyWith(color: Palette.violet),
                          ),
                          SizedBox(height: 28.0.h),
                          Text(
                            aboutData.title.toCapitalized(),
                            style: StyleTextTheme.headlineMedium,
                          ),
                          const SizedBox(height: 8),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 40),
                            height: 4.0.h,
                            width: context.isDisplayLargeThanTablet
                                ? MediaQuery.sizeOf(context).width / 12
                                : MediaQuery.sizeOf(context).width * 0.6,
                            decoration: BoxDecoration(
                              color: Palette.violet,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            width: context.isDisplayLargeThanTablet
                                ? MediaQuery.sizeOf(context).width / 4
                                : MediaQuery.sizeOf(context).width * 0.6,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              aboutData.subtitle.toCapitalized(),
                              style: StyleTextTheme.headlineSmall,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                )),
            ResponsiveRowColumnItem(
              rowFlex: 1,
              rowFit: FlexFit.loose,
              child: Container(
                alignment: Alignment.topRight,
                constraints: BoxConstraints(
                  minHeight: context.isDisplayLargeThanTablet ? 640 : 500,
                ),
                child: Wrap(
                  crossAxisAlignment: context.isDisplayLargeThanTablet
                      ? WrapCrossAlignment.end
                      : WrapCrossAlignment.start,
                  alignment: WrapAlignment.spaceAround,
                  runAlignment: WrapAlignment.spaceAround,
                  direction: context.isDisplayLargeThanTablet
                      ? Axis.vertical
                      : Axis.horizontal,
                  spacing: 58,
                  runSpacing: 98,
                  children: [
                    ...aboutData.info.fold<List<Widget>>([], (widgetValue, e) {
                      final index = widgetValue.length;

                      widgetValue.add(Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ...splitAndDisplayText(e.tile),
                          RichText(
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
                                        ? Palette.violet
                                        : Palette.white,
                                  ),
                                ),
                              ],
                            ),
                          ).paddedH(0),
                        ],
                      ));
                      return widgetValue;
                    })
                  ],
                ),
              ),
            )
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
