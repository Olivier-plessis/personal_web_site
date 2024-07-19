import 'package:design_ui/design_ui.dart';
import 'package:flutter/material.dart';
import 'package:olivierplessis/core/utils/extension/responsive_extension.dart';
import 'package:olivierplessis/src/home/domain/model/header/header_model.dart';
import 'package:olivierplessis/src/home/presentation/layout/header/left_header_section.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HeaderLayout extends StatefulWidget {
  const HeaderLayout({super.key, required this.headerData});
  final HeaderSection headerData;

  @override
  State<HeaderLayout> createState() => _HeaderLayoutState();
}

class _HeaderLayoutState extends State<HeaderLayout>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    duration: const Duration(seconds: 6),
    vsync: this,
  )..repeat(reverse: true);

  late Animation<Offset> _animation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(0, 0.08),
  ).animate(CurvedAnimation(
      parent: _animationController, curve: Curves.easeInOutSine));

  late Animation<Offset> _animationFill = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(0, 0.07),
  ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.decelerate));

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

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
            headerData: widget.headerData,
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

  Widget _rightContentLayout(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: context.isDisplayLargeThanTablet ? 840 : 500,
      ),
      child: Stack(
        children: [
          SlideTransition(
            position: _animation,
            child: AspectRatio(
              aspectRatio: 1.5,
              child: ImagePictureCustom(
                path: BrandingAssets.bdgFillPhoneHeader,
              ),
            ),
          ),
          SlideTransition(
            position: _animationFill,
            child: AspectRatio(
              aspectRatio: 1.5,
              child: ImagePictureCustom(
                path: BrandingAssets.bdgPhoneHeader,
              ),
            ),
          ),
          AspectRatio(
            aspectRatio: 1.5,
            child: ImagePictureCustom(
              path: BrandingAssets.bdgIconHeader,
            ),
          ),
        ],
      ),
    );
  }
}
