import 'package:design_ui/design_ui.dart';
import 'package:flutter/material.dart';
import 'package:olivierplessis/core/utils/extension/responsive_extension.dart';
import 'package:olivierplessis/core/utils/split_and_display_text.dart';
import 'package:olivierplessis/src/home/domain/model/about/about_model.dart';

class RightAboutSection extends StatelessWidget {
  const RightAboutSection(
      {super.key, required this.aboutData, required this.titleSize});

  final AboutSection aboutData;
  final TextStyle titleSize;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: context.isDisplayLargeThanTablet
          ? WrapCrossAlignment.end
          : WrapCrossAlignment.start,
      alignment: WrapAlignment.spaceAround,
      runAlignment: WrapAlignment.spaceAround,
      direction:
          context.isDisplayLargeThanTablet ? Axis.vertical : Axis.horizontal,
      spacing: 98,
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
                    color: Theme.of(context).primaryColor,
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
                            : Theme.of(context).primaryColor,
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
    );
  }
}
