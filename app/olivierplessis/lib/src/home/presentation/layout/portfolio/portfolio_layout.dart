import 'dart:math';

import 'package:design_ui/design_ui.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:olivierplessis/core/utils/extension/responsive_extension.dart';
import 'package:olivierplessis/src/home/domain/model/portfolio/portfolio_model.dart';
import 'package:olivierplessis/src/home/presentation/widget/title_with_colored_text.dart';
import 'package:responsive_framework/responsive_framework.dart';

class PortfolioLayout extends ConsumerWidget {
  const PortfolioLayout({super.key, required this.portfolio});

  final PortfolioSection portfolio;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String title = portfolio.title.toCapitalized();
    Color ideasColor = Palette.violet;

    Widget titleWidget = TitleWithColoredText(
      title: title,
      ideasColor: ideasColor,
      coloredTitleParts: [4, 5], // These words will be colored blue
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
                maxWidth: context.isDisplayLargeThanTablet ? 650 : 500,
              ),
              child: titleWidget),
        ),
        GridView(
          padding: EdgeInsets.only(top: 26.0.h),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: min(currentCount, minCount),
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
            childAspectRatio: 1.3,
          ),
          children: [
            ...portfolio.workItems.take(5).fold<List<Widget>>([],
                (acc, workItem) {
              return acc
                ..addAll([
                  PackageCard(
                    package: workItem,
                    isOdd: acc.length.isOdd,
                  ),
                ]);
            }).toList(),
            Container(
              decoration: BoxDecoration(
                color: Palette.grey.withOpacity(0.5),
                border: Border.all(
                    color: Palette.violet.withOpacity(0.5), width: 2),
                boxShadow: const [
                  BoxShadow(
                      color: Color(0x4D000000),
                      offset: Offset(0, 2),
                      blurRadius: 5),
                ],
                borderRadius: BorderRadius.circular(10.0.r),
              ),
              child: Center(
                child: Text(
                  "vide",
                  style: TextStyle(fontSize: 24, color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ],
    ).paddedLTRB(16.0, (56 * 2), 16.0, 8.0);
  }
}

class PackageCard extends StatelessWidget {
  const PackageCard({
    Key? key,
    required this.package,
    required this.isOdd,
  });
  final WorkItem package;
  final bool isOdd;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Palette.violet.withOpacity(0.5), width: 2),
        boxShadow: const [
          BoxShadow(
              color: Color(0x4D000000), offset: Offset(0, 2), blurRadius: 5),
        ],
        borderRadius: BorderRadius.circular(10.0.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
                onTap: () {},
                child: Text(package.category, overflow: TextOverflow.ellipsis)),
          ),
          Text(package.title,
              style: const TextStyle(fontSize: 14, height: 1.6),
              maxLines: 3,
              overflow: TextOverflow.clip),
          const Padding(padding: EdgeInsets.only(bottom: 16)),
          if (ResponsiveBreakpoints.of(context).largerThan('MOBILE_LARGE'))
            const Spacer(),
          const Padding(padding: EdgeInsets.only(bottom: 8)),
        ],
      ),
    );
  }
}

/*

class PortfolioItems extends StatelessWidget {
  const PortfolioItems({super.key, required this.popularPackages});
  final PortfolioSection popularPackages;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...popularPackages.workItems.take(4).fold<List<ResponsiveRowColumn>>([],
            (acc, workItem) {
          final isOdd = acc.length.isOdd;
          final leftChild = isOdd
              ? LeftPortfolioSection(portfolio: workItem, isOdd: isOdd)
              : SizedBox.shrink();
          final rightChild = !isOdd
              ? RightPortfolioSection(portfolio: workItem, isOdd: isOdd)
              : SizedBox.shrink();

          return acc
            ..addAll([
              ResponsiveRowColumn(
                columnMainAxisAlignment: MainAxisAlignment.spaceAround,
                columnSpacing: 24,
                rowPadding: EdgeInsets.fromLTRB(16.0, 26.0.h, 16.0, 8.0),
                rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
                layout: context.isDisplayLargeThanTablet
                    ? ResponsiveRowColumnType.ROW
                    : ResponsiveRowColumnType.COLUMN,
                children: [
                  ResponsiveRowColumnItem(
                    rowFlex: !isOdd ? 4 : 1,
                    rowFit: FlexFit.tight,
                    child: rightChild,
                  ),
                  ResponsiveRowColumnItem(
                    rowFlex: isOdd ? 6 : 1,
                    rowFit: FlexFit.tight,
                    child: leftChild,
                  ),
                ],
              ),
            ]);
        }).toList(),
      ],
    );
  }
}

class LeftPortfolioSection extends StatefulWidget {
  const LeftPortfolioSection({
    super.key,
    required this.portfolio,
    required this.isOdd,
  });

  final WorkItem portfolio;
  final bool isOdd;

  @override
  State<LeftPortfolioSection> createState() => _LeftPortfolioSectionState();
}

class _LeftPortfolioSectionState extends State<LeftPortfolioSection> {
  int imageWidth = 0;
  int imageHeight = 0;
  double imageRatio = 1;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Image image = Image.asset(
        widget.portfolio.coverImage,
        package: "design_ui",
      );
      Completer<ui.Image> completer = Completer<ui.Image>();
      image.image
          .resolve(ImageConfiguration())
          .addListener(ImageStreamListener((info, async) {
        completer.complete(info.image);
        int width = info.image.width;
        int height = info.image.height;
        double aspectRatio = info.image.width / info.image.height;
        setState(() {
          imageWidth = width;
          imageHeight = height;
          imageRatio = aspectRatio;
        });
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    if (imageHeight == 0) {
      return const SizedBox.shrink();
    }
    return Stack(
        clipBehavior: Clip.antiAlias,
        fit: StackFit.loose,
        alignment: context.isDisplayLargeThanTablet
            ? Alignment.topRight
            : Alignment.topLeft,
        children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: context.isDisplayLargeThanTablet
                  ? imageHeight.toDouble()
                  : MediaQuery.sizeOf(context).width,
            ),
            child: AspectRatio(
              aspectRatio: imageRatio,
              child: RepaintBoundary(
                child: ImagePictureCustom(
                  path: widget.portfolio.coverImage,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              right: context.isDisplayLargeThanTablet
                  ? imageWidth.toDouble() / 1.2
                  : 0,
              left: 0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  widget.portfolio.title.toCapitalized(),
                  style: StyleTextTheme.textThemeDisplayMedium.copyWith(
                    fontWeight: FontWeightTheme.medium,
                  ),
                ).paddedT(12.0.h),
                Text(
                  widget.portfolio.subtitle.toCapitalized(),
                  style: StyleTextTheme.labelMedium,
                ),
              ],
            ).paddedT(imageHeight.toDouble() / 4),
          ),
        ]);
  }
}

class RightPortfolioSection extends StatefulWidget {
  const RightPortfolioSection({
    super.key,
    required this.portfolio,
    required this.isOdd,
  });

  final WorkItem portfolio;
  final bool isOdd;

  @override
  State<RightPortfolioSection> createState() => _RightPortfolioSectionState();
}

class _RightPortfolioSectionState extends State<RightPortfolioSection> {
  int imageWidth = 0;
  int imageHeight = 0;
  double imageRatio = 1;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Image image = Image.asset(
        widget.portfolio.coverImage,
        package: "design_ui",
      );
      Completer<ui.Image> completer = Completer<ui.Image>();
      image.image
          .resolve(ImageConfiguration())
          .addListener(ImageStreamListener((info, async) {
        completer.complete(info.image);
        int width = info.image.width;
        int height = info.image.height;
        double aspectRatio = info.image.width / info.image.height;
        setState(() {
          imageWidth = width;
          imageHeight = height;
          imageRatio = aspectRatio;
        });
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    if (imageHeight == 0) {
      return const SizedBox.shrink();
    }
    return Stack(
        clipBehavior: Clip.antiAlias,
        fit: StackFit.loose,
        alignment: Alignment.topLeft,
        children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: context.isDisplayLargeThanTablet
                  ? imageHeight.toDouble()
                  : MediaQuery.of(context).size.width,
            ),
            child: AspectRatio(
              aspectRatio: imageRatio,
              child: RepaintBoundary(
                child: ImagePictureCustom(
                  path: widget.portfolio.coverImage,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: ResponsiveBreakpoints.of(context).screenWidth >= 1145
                  ? imageWidth.toDouble() - 100
                  : 0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.portfolio.title.toCapitalized(),
                  style: StyleTextTheme.textThemeDisplayMedium.copyWith(
                    fontWeight: FontWeightTheme.medium,
                  ),
                ).paddedT(12.0.h),
                Text(
                  widget.portfolio.subtitle.toCapitalized(),
                  style: StyleTextTheme.labelMedium,
                ),
              ],
            ).paddedT(56.0.h),
          ),
        ]);
  }
}
*/
