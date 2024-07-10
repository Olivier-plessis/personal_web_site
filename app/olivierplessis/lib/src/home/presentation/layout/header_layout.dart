import 'package:design_ui/design_ui.dart';
import 'package:flutter/material.dart';
import 'package:olivierplessis/core/utils/extension/responsive_extension.dart';
import 'package:olivierplessis/src/home/domain/model/header/header_model.dart';
import 'package:olivierplessis/src/home/presentation/widget/title_with_colored_text.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HeaderLayout extends StatelessWidget {
  const HeaderLayout({super.key, required this.headerData});
  final HeaderSection headerData;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ResponsiveRowColumn(
          columnMainAxisAlignment: MainAxisAlignment.center,
          columnSpacing: 24,
          rowMainAxisAlignment: MainAxisAlignment.spaceAround,
          layout: context.isDisplayLargeThanTablet
              ? ResponsiveRowColumnType.ROW
              : ResponsiveRowColumnType.COLUMN,
          children: [
            ResponsiveRowColumnItem(
              rowFlex: context.isDisplayLargeThanDesktop ? 5 : 4,
              columnOrder: 1,
              child: _leftContentLayout(context, headerData),
            ),
            ResponsiveRowColumnItem(
              rowFlex: 8,
              columnOrder: 2,
              child: _rightContentLayout(context),
            ),
          ],
        ),
      ],
    ).paddedHV(4, kToolbarHeight / 2);
  }
}

Widget _leftContentLayout(BuildContext context, HeaderSection headerData) {
  String title = headerData.title.toCapitalized();
  String subtitle = headerData.subtitle.toCapitalized();

  Color ideasColor = Palette.violet; // Change color here

  Widget titleWidget = TitleWithColoredText(
    title: title,
    ideasColor: ideasColor,
    coloredTitleParts: [4, 5], // These words will be colored blue
  );

  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    titleWidget, // Name
    Text(subtitle, style: StyleTextTheme.headlineSmall).paddedV(56),

    InkWell(
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () {},
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(headerData.link.toCapitalized(),
                style:
                    StyleTextTheme.labelMedium.copyWith(color: Palette.violet)),
            const SizedBox(width: 64),
            const Icon(Icons.arrow_forward_sharp,
                size: 24, color: Palette.violet),
          ],
        )),
    const SizedBox(height: 32),
  ]);
}

Widget _rightContentLayout(BuildContext context) {
  return ConstrainedBox(
    constraints: BoxConstraints(
      maxHeight: context.isDisplayLargeThanTablet ? 740 : 500,
    ),
    child: AspectRatio(
      aspectRatio: 1,
      child: SvgPictureCustom(
        path: BrandingAssets.bdgHeaderBranding,
      ),
    ),
  );
}
