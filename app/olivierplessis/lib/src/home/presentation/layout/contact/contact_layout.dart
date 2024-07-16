import 'package:design_ui/design_ui.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:olivierplessis/core/utils/extension/responsive_extension.dart';
import 'package:olivierplessis/core/utils/url_handler.dart';
import 'package:olivierplessis/src/home/domain/enum/social_network_enum.dart';
import 'package:olivierplessis/src/home/domain/model/contact/contact_model.dart';
import 'package:olivierplessis/src/home/presentation/provider/parts/contact/launch_email_provider.dart';
import 'package:olivierplessis/src/home/presentation/widget/text_link_widget.dart';
import 'package:olivierplessis/src/home/presentation/widget/title_with_colored_text.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ContactLayout extends ConsumerWidget {
  const ContactLayout({super.key, required this.contactData});

  final ContactSection contactData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ResponsiveRowColumn(
      columnCrossAxisAlignment: CrossAxisAlignment.center,
      rowCrossAxisAlignment: CrossAxisAlignment.center,
      layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
          ? ResponsiveRowColumnType.COLUMN
          : ResponsiveRowColumnType.ROW,
      children: [
        ResponsiveRowColumnItem(
          rowFlex: context.isDisplayLargeThanDesktop ? 2 : 4,
          columnOrder: 1,
          child: LeftContactSection(
            contactData: contactData,
            onTap: () {
              ref.watch(launchMailtoProvider(
                'Prise de contact',
                'Ooops, une erreur est survenue lors de l\'envoi de votre message',
              ));
            },
          ),
        ),
        ResponsiveRowColumnItem(
          rowFlex: context.isDisplayLargeThanDesktop ? 2 : 6,
          columnOrder: 2,
          child: _rightContactLayout(context),
        ),
      ],
    );
  }
}

class LeftContactSection extends StatelessWidget {
  const LeftContactSection({
    super.key,
    required this.contactData,
    required this.onTap,
  });

  final ContactSection contactData;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    String title = contactData.title.toCapitalized();

    Color ideasColor = Palette.violet; // Change color here

    Widget titleWidget = TitleWithColoredText(
      title: title,
      ideasColor: ideasColor,
      coloredTitleParts: [2, 3], // These words will be colored blue
    );

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: context.isDisplayLargeThanTablet ? 560 : 800,
          ),
          child: titleWidget),
      TextLinkWidget(
        text: contactData.link,
        onTap: onTap,
      ).paddedT(58.0.h),
      Text(contactData.followMe.toCapitalized(),
              style: StyleTextTheme.headlineSmall)
          .paddedTB(36.0.h, 20.0.h),
      Row(
        children: [
          ...contactData.socialLinks.fold<List<Widget>>([], (acc, link) {
            String iconName = socialNetworkEnum.values
                .firstWhere((element) => element.name.contains(link.name))
                .name;

            final index = acc.length;
            return [
              ...acc,
              InkWell(
                onTap: () {
                  openUrl(
                    url: link.link,
                  );
                },
                child: SvgPictureCustom(
                  path: iconName,
                ),
              ).paddedL(index == 0 ? 0 : 30),
            ];
          }),
        ],
      ),
    ]);
  }
}

Widget _rightContactLayout(BuildContext context) {
  return Container(
    padding: EdgeInsets.only(top: 26.0.h),
    constraints: BoxConstraints(
      maxHeight: context.isDisplayLargeThanTablet ? 640 : 500,
    ),
    child: AspectRatio(
      aspectRatio: 1.2,
      child: ImagePictureCustom(
        path: BrandingAssets.bdgContact,
      ),
    ),
  );
}
