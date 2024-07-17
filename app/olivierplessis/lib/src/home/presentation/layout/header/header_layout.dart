import 'package:design_ui/design_ui.dart';
import 'package:flutter/material.dart';
import 'package:olivierplessis/core/utils/extension/responsive_extension.dart';
import 'package:olivierplessis/src/home/domain/model/header/header_model.dart';
import 'package:olivierplessis/src/home/presentation/layout/header/left_header_section.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HeaderLayout extends StatelessWidget {
  const HeaderLayout({super.key, required this.headerData});
  final HeaderSection headerData;
  @override
  Widget build(BuildContext context) {
    return ResponsiveRowColumn(
      layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
          ? ResponsiveRowColumnType.COLUMN
          : ResponsiveRowColumnType.ROW,
      columnCrossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ResponsiveRowColumnItem(
          rowFlex: context.isDisplayLargeThanDesktop ? 2 : 4,
          columnOrder: 1,
          child: LeftHeaderSection(
            headerData: headerData,
            onTap: () {},
          ),
        ),
        ResponsiveRowColumnItem(
          rowFlex: context.isDisplayLargeThanDesktop ? 3 : 6,
          columnOrder: 2,
          child: _rightContentLayout(context),
        ),
      ],
    );
  }
}

Widget _rightContentLayout(BuildContext context) {
  return ConstrainedBox(
    constraints: BoxConstraints(
      maxHeight: context.isDisplayLargeThanTablet ? 840 : 500,
    ),
    child: AspectRatio(
      aspectRatio: 1.5,
      child: ImagePictureCustom(
        path: BrandingAssets.bdgHeaderBrandingBlueDarken,
      ),
    ),
  );
}
