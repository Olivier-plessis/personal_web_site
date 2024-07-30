import 'package:design_ui/design_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:olivierplessis/core/utils/extension/responsive_extension.dart';
import 'package:olivierplessis/src/home/domain/model/privacy/privacy_model.dart';
import 'package:olivierplessis/src/home/presentation/widget/title_with_colored_text.dart';
import 'package:olivierplessis/src/routing/route_constant.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print(privacy);

    Widget titleWidget = TitleWithColoredText(
      title: privacy.first.title,
      fontWeight: FontWeightTheme.extraBold,
      ideasColor: Palette.teal, // Change color here
      coloredTitleParts: [1], // These words will be colored blue
    );

    return Scaffold(
      appBar: _buildAppBar(context),
      body: Align(
        alignment: Alignment.topCenter,
        child: BlockWrapperC(Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            titleWidget,
            Text('1. Présentation du site.'),
            Text(
                '''En vertu de l’article 6 de la loi n°2004-575 du 21 juin 2004 pour la confiance dans l’économie numérique, il est précisé aux utilisateurs du site olivierplessis l’identité des différents intervenants dans le cadre de sa réalisation et de son suivi'''),
          ],
        )),
      ),
    );
  }

  PreferredSize _buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight + 16),
      child: AppBar(
        elevation: 0.0,
        forceMaterialTransparency: true,
        leading: IconButton(
          onPressed: () => context.pushReplacementNamed(AppPage.home.routeName),
          style: IconButton.styleFrom(
            backgroundColor: Colors.white,
          ),
          icon: Icon(Icons.close, color: Palette.teal),
        ),
        backgroundColor: Colors.transparent,
      ).paddedAll(16),
    );
  }
}
