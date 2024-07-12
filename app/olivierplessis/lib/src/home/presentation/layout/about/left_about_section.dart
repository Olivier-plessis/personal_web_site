import 'package:design_ui/design_ui.dart';
import 'package:flutter/material.dart';
import 'package:olivierplessis/core/utils/extension/responsive_extension.dart';
import 'package:olivierplessis/src/home/domain/model/about/about_model.dart';
import 'package:olivierplessis/src/home/presentation/widget/text_link_widget.dart';

class LeftAboutSection extends StatelessWidget {
  const LeftAboutSection({
    super.key,
    required this.aboutData,
    required this.titleSize,
    required this.onTap,
  });

  final AboutSection aboutData;
  final TextStyle titleSize;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: context.isDisplayLargeThanTablet ? 640 : 500,
      ),
      child: Stack(clipBehavior: Clip.hardEdge, children: <Widget>[
        Positioned(
            right: 0,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: context.isDisplayLargeThanTablet ? 620 : 500,
              ),
              child: AspectRatio(
                aspectRatio: 1,
                child: RepaintBoundary(
                  child: ImagePictureCustom(
                    path: BrandingAssets.bdgPhoto,
                  ),
                ),
              ),
            )),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: context.isDisplayLargeThanTablet ? 940 : 500,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                aboutData.sectionTitle.toCapitalized(),
                style: titleSize.copyWith(color: Palette.violet),
              ),
              Text(
                aboutData.title.toCapitalized(),
                style: StyleTextTheme.textThemeDisplayMedium.copyWith(
                  fontWeight: FontWeightTheme.medium,
                ),
              ).paddedT(12.0.h),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 40),
                height: 4.0.h,
                width: context.isDisplayLargeThanTablet
                    ? MediaQuery.sizeOf(context).width / 12
                    : MediaQuery.sizeOf(context).width * 0.6,
                decoration: BoxDecoration(
                  color: Palette.violet,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                constraints: BoxConstraints(
                  maxWidth: context.isDisplayLargeThanTablet ? 640 : 800,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  aboutData.subtitle.toCapitalized(),
                  style: StyleTextTheme.labelMedium,
                ),
              ),
              TextLinkWidget(
                text: aboutData.link,
                onTap: onTap,
              ).paddedV(96.0),
            ],
          ),
        ),
      ]),
    );
  }
}
