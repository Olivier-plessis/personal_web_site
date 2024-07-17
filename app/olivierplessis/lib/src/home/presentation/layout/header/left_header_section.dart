import 'package:design_ui/design_ui.dart';
import 'package:flutter/material.dart';
import 'package:olivierplessis/src/home/domain/model/header/header_model.dart';
import 'package:olivierplessis/src/home/presentation/widget/text_link_widget.dart';
import 'package:olivierplessis/src/home/presentation/widget/title_with_colored_text.dart';

class LeftHeaderSection extends StatelessWidget {
  const LeftHeaderSection({
    super.key,
    required this.headerData,
    required this.onTap,
  });

  final HeaderSection headerData;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    String title = headerData.title.toCapitalized();
    String subtitle = headerData.subtitle.toCapitalized();

    Color ideasColor = Palette.teal; // Change color here

    Widget titleWidget = TitleWithColoredText(
      title: title,
      fontWeight: FontWeightTheme.extraBold,
      ideasColor: ideasColor,
      coloredTitleParts: [4, 5], // These words will be colored blue
    );

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      titleWidget, // Name
      Text(subtitle, style: StyleTextTheme.headlineSmall).paddedV(56),
      TextLinkWidget(
        text: headerData.link,
        onTap: onTap,
      ),
    ]);
  }
}
