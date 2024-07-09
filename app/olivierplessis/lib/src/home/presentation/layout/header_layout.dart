import 'dart:convert';

import 'package:design_ui/design_ui.dart';
import 'package:flutter/material.dart';
import 'package:olivierplessis/core/utils/extension/responsive_extension.dart';
import 'package:responsive_framework/responsive_framework.dart';

String jsonString =
    '{"header": {"title": "Ensemble donnons vie à vos idées d\'applications !", "subtitle": "Des applications sur mesure qui captivent les utilisateurs grace à la pussance de Flutter."}}';
Map<String, dynamic> jsonData = json.decode(jsonString);

class HeaderLayout extends StatelessWidget {
  const HeaderLayout({super.key});

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
              child: _leftContentLayout(context),
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

Widget _leftContentLayout(BuildContext context) {
  String title = jsonData['header']['title'];
  String subtitle = jsonData['header']['subtitle'];

  Color ideasColor = Palette.violet; // Change color here

  Widget titleWidget = TitleWithColoredText(title: title, ideasColor: ideasColor);

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
            Text('En savoir plus',
                style: StyleTextTheme.labelMedium.copyWith(color: Palette.violet)),
            const SizedBox(width: 64),
            const Icon(Icons.arrow_forward_sharp, size: 24, color: Palette.violet),
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
        context.isDisplayLargeThanTablet ? StyleTextTheme.headline2 : StyleTextTheme.labelMedium;

    return Wrap(
      children: [
        for (final part in titleParts)
          Text(
            '$part ',
            style: titleSize.copyWith(
              height: 1.2,
              color: !part.contains(titleParts[4]) && !part.contains(titleParts[5])
                  ? Theme.of(context).colorScheme.onSurface
                  : ideasColor,
            ),
          ),
      ],
    );
  }
}
