import 'package:design_ui/design_ui.dart';
import 'package:flutter/material.dart';
import 'package:olivierplessis/core/utils/extension/responsive_extension.dart';

class TitleWithColoredText extends StatelessWidget {
  final String title;
  final Color ideasColor;
  final List<int> coloredTitleParts;

  const TitleWithColoredText({
    super.key,
    required this.title,
    required this.ideasColor,
    required this.coloredTitleParts,
  });

  @override
  Widget build(BuildContext context) {
    final titleParts = title.split(' ');

    TextStyle titleSize = context.isDisplayLargeThanTablet
        ? StyleTextTheme.textThemeDisplayLarge
        : StyleTextTheme.labelMedium;

    return Wrap(
      children: [
        for (final part in titleParts)
          Text(
            '$part ',
            style: titleSize.copyWith(
              height: 1.2,
              letterSpacing: 1.9,
              color: part.contains(titleParts[coloredTitleParts.first]) ||
                      part.contains(titleParts[coloredTitleParts.last])
                  ? ideasColor
                  : Theme.of(context).colorScheme.onSurface,
            ),
          ),
      ],
    );
  }
}
