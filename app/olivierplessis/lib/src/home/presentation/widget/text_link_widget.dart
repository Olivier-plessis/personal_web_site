import 'package:design_ui/design_ui.dart';
import 'package:flutter/material.dart';

class TextLinkWidget extends StatelessWidget {
  const TextLinkWidget({
    super.key,
    required this.text,
    required this.onTap,
  });

  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(text.toCapitalized(),
                style:
                    StyleTextTheme.labelMedium.copyWith(color: Palette.violet)),
            const SizedBox(width: 64),
            const Icon(Icons.arrow_forward_sharp,
                size: 24, color: Palette.violet),
          ],
        ));
  }
}
