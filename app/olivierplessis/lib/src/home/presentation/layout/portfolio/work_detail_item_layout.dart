import 'package:design_ui/design_ui.dart';
import 'package:flutter/material.dart';
import 'package:olivierplessis/core/utils/extension/responsive_extension.dart';
import 'package:olivierplessis/core/utils/url_handler.dart';
import 'package:olivierplessis/src/home/domain/model/portfolio/portfolio_model.dart';
import 'package:responsive_framework/responsive_framework.dart';

class WorkDetailItemLayout extends StatelessWidget {
  WorkDetailItemLayout(
      {super.key, required this.workItem, required this.offset});
  final WorkItem? workItem;
  final double offset;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.zero,
      physics: offset < 1
          ? const NeverScrollableScrollPhysics()
          : ClampingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: MaxSizeConstant.maxWidth,
            padding: EdgeInsets.symmetric(horizontal: 55),
            child: Text('Date de réalisation : ${workItem!.realisationDate}',
                style: StyleTextTheme.labelMedium),
          ),
          ResponsiveRowColumn(
            columnCrossAxisAlignment: CrossAxisAlignment.start,
            rowCrossAxisAlignment: CrossAxisAlignment.start,
            columnPadding: blockPadding(context),
            rowPadding: blockPadding(context),
            layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                ? ResponsiveRowColumnType.COLUMN
                : ResponsiveRowColumnType.ROW,
            children: [
              ResponsiveRowColumnItem(
                rowFlex: context.isDisplayLargeThanDesktop ? 2 : 4,
                columnOrder: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Description', style: StyleTextTheme.labelMedium),
                    const SizedBox(height: 8),
                    buildMessageRow(
                      message:
                          workItem?.description.replaceAll(".", ". \n") ?? '',
                      imagePath: workItem?.coverImage ?? '',
                    ).paddedR(52),
                    const SizedBox(height: 12),
                    Text('Technos', style: StyleTextTheme.labelMedium),
                    Wrap(
                      runAlignment: WrapAlignment.start,
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        ...?workItem?.tags
                            .map((tag) => Chip(
                                  label: Text('$tag'.toUpperCase()),
                                  backgroundColor: Palette.tealDark,
                                  labelStyle: StyleTextTheme.labelLight,
                                ).paddedAll(6.0))
                            .toList(),
                      ],
                    ),
                  ],
                ),
              ),
              ResponsiveRowColumnItem(
                  rowFlex: context.isDisplayLargeThanDesktop ? 2 : 6,
                  columnOrder: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Mission', style: StyleTextTheme.labelMedium),
                      const SizedBox(height: 8),
                      buildMessageRow(
                        message: workItem?.entrustedTask ?? '',
                        imagePath: workItem?.coverImage ?? '',
                      ),
                      const SizedBox(height: 12),
                    ],
                  )),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: context.isDisplayLargeThanTablet ? 55 : 15),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              if (workItem?.title == "Liça")
                Text(
                  'application en cours de refonte',
                  style: StyleTextTheme.textThemeDisplayLarge.copyWith(
                    fontWeight: FontWeightTheme.bold,
                  ),
                ),
              if (workItem?.link.websiteUrl.isNotEmpty ?? false)
                buildLinkButton(
                  url: workItem?.link.websiteUrl ?? '',
                  child: Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0.r),
                      border: Border.all(
                        color: Color(0xFFA6A6A6),
                        width: 2,
                      ),
                      image: DecorationImage(
                        image: AssetImage(workItem?.logo ?? '',
                            package: 'design_ui'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              if (workItem?.link.storeIos.isNotEmpty ?? false)
                buildLinkButton(
                  url: workItem?.link.storeIos ?? '',
                  child: SvgPictureCustom(
                    path: IconAssets.icAppstore,
                  ).paddedL(24),
                ),
              if (workItem?.link.storeAndroid.isNotEmpty ?? false)
                buildLinkButton(
                  url: workItem?.link.storeAndroid ?? '',
                  child: SvgPictureCustom(
                    path: IconAssets.icGoogleplay,
                  ).paddedL(24),
                ),
            ]).paddedT(12.0.h),
          ),
        ],
      ).paddedB(24.0.h),
    );
  }

  Row buildMessageRow({
    required String imagePath,
    required String message,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            // child: const Text('What a trip! Thanks for all the memories! Whats next?'),
            child: Text(message, style: StyleTextTheme.labelRegular),
          ),
        ),
      ],
    );
  }

  Widget buildLinkButton({required String url, required Widget child}) {
    return InkWell(
      onTap: () => openUrl(url: url),
      child: child,
    );
  }
}
