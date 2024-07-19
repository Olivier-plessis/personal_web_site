import 'package:design_ui/design_ui.dart';
import 'package:flutter/material.dart';
import 'package:olivierplessis/core/utils/extension/responsive_extension.dart';
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
      physics: offset < 1
          ? const NeverScrollableScrollPhysics()
          : ClampingScrollPhysics(),
      child: ResponsiveRowColumn(
        rowPadding: blockPadding(context),
        columnCrossAxisAlignment: CrossAxisAlignment.center,
        rowCrossAxisAlignment: CrossAxisAlignment.center,
        layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
            ? ResponsiveRowColumnType.COLUMN
            : ResponsiveRowColumnType.ROW,
        children: [
          ResponsiveRowColumnItem(
            rowFlex: context.isDisplayLargeThanDesktop ? 2 : 4,
            columnOrder: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 66.0.h),
                const Text('Description', style: TextStyle()),
                const SizedBox(height: 8),
                buildMessageRow(
                    message:
                        workItem?.description.replaceAll(".", ". \n") ?? '',
                    imagePath: workItem?.coverImage ?? ''),
                const SizedBox(height: 12),
              ],
            ),
          ),
          ResponsiveRowColumnItem(
              rowFlex: context.isDisplayLargeThanDesktop ? 2 : 6,
              columnOrder: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 66.0.h),
                  const Text('Description', style: TextStyle()),
                  const SizedBox(height: 8),
                  buildMessageRow(
                      message: workItem?.description.returnToLine() ?? '',
                      imagePath: workItem?.coverImage ?? ''),
                  const SizedBox(height: 12),
                ],
              )),
        ],
      ),
    );
  }

  Row buildMessageRow({required String imagePath, required String message}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(
            imagePath,
            package: 'design_ui',
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black26, width: 2),
            ),
            padding: const EdgeInsets.all(16),
            // child: const Text('What a trip! Thanks for all the memories! Whats next?'),
            child: Text(message),
          ),
        ),
      ],
    );
  }
}
