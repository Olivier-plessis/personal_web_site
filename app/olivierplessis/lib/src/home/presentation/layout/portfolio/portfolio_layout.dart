import 'package:design_ui/design_ui.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:olivierplessis/core/utils/extension/responsive_extension.dart';
import 'package:olivierplessis/src/home/domain/model/portfolio/portfolio_model.dart';
import 'package:olivierplessis/src/home/presentation/layout/portfolio/portfolio_large_slider.dart';
import 'package:olivierplessis/src/home/presentation/widget/title_with_colored_text.dart';
import 'package:responsive_framework/responsive_framework.dart';

class PortfolioLayout extends ConsumerWidget {
  const PortfolioLayout({super.key, required this.portfolio});

  final PortfolioSection portfolio;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String title = portfolio.title.toCapitalized();
    Color ideasColor = Palette.teal;

    Widget titleWidget = TitleWithColoredText(
      title: title,
      ideasColor: ideasColor,
      coloredTitleParts: [6], // These words will be colored blue
    );
    final currentCount = (MediaQuery.of(context).size.width ~/ 250).toInt();

    final minCount = 3;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: context.isDisplayLargeThanTablet ? 550 : 300,
              ),
              child: titleWidget),
        ),
        ResponsiveVisibility(
          visible: true,
          visibleConditions: const [
            Condition.largerThan(name: TABLET),
            Condition.equals(name: TABLET)
          ],
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Container(
              margin: EdgeInsets.only(top: 26.0.h),
              constraints: BoxConstraints(
                maxHeight: context.isDisplayLargeThanTablet ? 450 : 200,
              ),
              child: PortfolioLargeSlider(
                workItem: portfolio.workItems,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class WorkCard extends StatelessWidget {
  const WorkCard({
    Key? key,
    required this.package,
    required this.isOdd,
    required this.onTap,
  });
  final WorkItem package;
  final bool isOdd;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Palette.teal.withOpacity(0.5), width: 2),
        gradient: Palette.greyGradient,
        borderRadius: BorderRadius.circular(10.0.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
                onTap: onTap,
                child: Text(package.category, overflow: TextOverflow.ellipsis)),
          ),
        ],
      ),
    );
  }
}
