import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgPictureCustom extends StatelessWidget {
  final String path;
  final double? width;
  final double? height;
  final BoxFit? fit;

  SvgPictureCustom({
    required this.path,
    this.width,
    this.height,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      package: "design_ui",
      width: width,
      height: height,
      fit: fit ?? BoxFit.contain,
    );
  }
}
