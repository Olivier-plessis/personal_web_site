import 'dart:convert';

import 'package:design_ui/design_ui.dart';
import 'package:flutter/material.dart';
import 'package:olivierplessis/core/utils/extension/responsive_extension.dart';
import 'package:responsive_framework/responsive_framework.dart';

String jsonString =
    '{"header": {"title": "Ensemble donnons vie à vos idées \\n d\'applications !", "subtitle": "Des applications sur mesure qui captivent les utilisateurs grace à la pussance de Flutter."}}';
Map<String, dynamic> jsonData = json.decode(jsonString);

class HeaderLayout extends StatelessWidget {
  const HeaderLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return MaxWidthBox(
      maxWidth: MaxSizeConstant.maxWidth,
      alignment: Alignment.center,
      child: Column(
        children: [
          ResponsiveRowColumn(
            columnMainAxisAlignment: MainAxisAlignment.center,
            columnSpacing: 32,
            rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
            layout: context.isDisplayLargeThanTablet
                ? ResponsiveRowColumnType.ROW
                : ResponsiveRowColumnType.COLUMN,
            children: [
              ResponsiveRowColumnItem(
                rowFlex: 3,
                columnOrder: 1,
                child: _leftLayout(context),
              ),
              ResponsiveRowColumnItem(
                rowFlex: 6,
                columnOrder: 2,
                child: _rightLayout(context),
              ),
            ],
          ),
        ],
      ),
    ).paddedHV(64, context.isDisplayLargeThanTablet ? MediaQuery.of(context).size.height / 8 : 24);
  }
}

Widget _leftLayout(BuildContext context) {
  String title = jsonData['header']['title'];
  String subtitle = jsonData['header']['subtitle'];

  Color ideasColor = Palette.violet; // Change color here

  Widget titleWidget = TitleWithColoredText(title: title, ideasColor: ideasColor);

  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    titleWidget, // Name
    Text(subtitle, style: siteTextTheme.headlineSmall).paddedV(56),
    TextButton(
        onPressed: () {},
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Découvrir plus', style: siteTextTheme.labelMedium),
            const SizedBox(width: 64),
            Icon(Icons.arrow_forward_sharp, size: 24, color: Palette.violet),
          ],
        )),
    const SizedBox(height: 32),
  ]);
}

Widget _rightLayout(BuildContext context) {
  return ConstrainedBox(
    constraints: BoxConstraints(maxHeight: context.isDisplayLargeThanTablet ? 740 : 500),
    child: SvgPictureCustom(
      path: BrandingAssets.bdgHeaderBranding,
      width: context.isDisplayLargeThanTablet ? 740 : 500,
      height: context.isDisplayLargeThanTablet ? 740 : 500,
    ),
  );
}

class TitleWithColoredText extends StatelessWidget {
  final String title;
  final Color ideasColor;

  const TitleWithColoredText({
    super.key,
    required this.title,
    required this.ideasColor,
  });

  @override
  Widget build(BuildContext context) {
    final titleParts = title.split(' ');

    var titleSize =
        context.isDisplayLargeThanTablet ? siteTextTheme.displayMedium : siteTextTheme.displaySmall;

    return RichText(
      text: TextSpan(
        children: [
          for (final part in titleParts)
            TextSpan(
              text: '$part ',
              style: titleSize?.copyWith(
                color: !part.contains(titleParts[4]) && !part.contains(titleParts[5])
                    ? Theme.of(context).colorScheme.onSurface
                    : ideasColor,
              ),
            ),
        ],
      ),
    );
  }
}
