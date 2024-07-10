import 'package:design_ui/design_ui.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

extension XResponsiveBuildContext on BuildContext {
  bool get isDisplayLargeThanTablet =>
      ResponsiveBreakpoints.of(this).largerThan(TABLET);
  bool get isDisplayLargeThanDesktop =>
      ResponsiveBreakpoints.of(this).largerThan(DESKTOP);
}

extension XResponsiveFontSize on BuildContext {
  double get titleScaleFactor => isDisplayLargeThanTablet ? 1 : 1.9;
}

// Margin
const EdgeInsets marginBottom12 = EdgeInsets.only(bottom: 12);
const EdgeInsets marginBottom24 = EdgeInsets.only(bottom: 24);
const EdgeInsets marginBottom40 = EdgeInsets.only(bottom: 40);

// Padding
const EdgeInsets paddingBottom24 = EdgeInsets.only(bottom: 24);

// Block Spacing
const List<Condition<BoxConstraints?>> blockWidthConstraints = [
  Condition.equals(name: MOBILE, value: BoxConstraints(maxWidth: 600)),
  Condition.equals(name: TABLET, value: BoxConstraints(maxWidth: 768)),
  Condition.largerThan(
      name: TABLET, value: BoxConstraints(maxWidth: MaxSizeConstant.maxWidth)),
];

EdgeInsets blockPadding(BuildContext context) =>
    ResponsiveValue<EdgeInsets>(context,
        defaultValue: const EdgeInsets.symmetric(horizontal: 55, vertical: 80),
        conditionalValues: [
          const Condition.smallerThan(
              name: TABLET,
              value: EdgeInsets.symmetric(horizontal: 15, vertical: 45))
        ]).value;

const EdgeInsets blockMargin = EdgeInsets.fromLTRB(10, 0, 10, 32);

class BlockWrapper extends StatelessWidget {
  final Widget widget;

  const BlockWrapper(this.widget, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ResponsiveConstraints(
          conditionalConstraints: blockWidthConstraints, child: widget),
    );
  }
}
