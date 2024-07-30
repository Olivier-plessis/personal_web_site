import 'package:design_ui/design_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:olivierplessis/core/utils/extension/responsive_extension.dart';
import 'package:olivierplessis/src/home/domain/model/privacy/privacy_model.dart';
import 'package:olivierplessis/src/home/presentation/provider/privacy_provider.dart';
import 'package:olivierplessis/src/home/presentation/widget/title_with_colored_text.dart';
import 'package:olivierplessis/src/routing/route_constant.dart';

class PrivacyScreen extends ConsumerWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncPrivacyData = ref.watch(privacyDataProvider);

    return switch (asyncPrivacyData) {
      AsyncData(:final value) => PrivacyDetailScreen(privacy: value),
      AsyncError(:final error) => Text('Error: $error'),
      _ => const SizedBox.shrink(),
    };
  }
}

class PrivacyDetailScreen extends StatelessWidget {
  const PrivacyDetailScreen({super.key, required this.privacy});

  final PrivacyModel privacy;

  @override
  Widget build(BuildContext context) {
    Widget titleWidget = TitleWithColoredText(
      title: privacy.title,
      fontWeight: FontWeightTheme.extraBold,
      ideasColor: Palette.teal, // Change color here
      coloredTitleParts: [1], // These words will be colored blue
    );

    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.topCenter,
          child: BlockWrapperC(Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleWidget,
              ...privacy.description.asMap().entries.map((entry) {
                final index = entry.key + 1;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${index}. ${entry.value.tile}',
                            style: StyleTextTheme.labelMedium)
                        .paddedV(8.0.h),
                    ...entry.value.description
                        .map((e) => Text(e).paddedH(12.0.h))
                        .toList(),
                  ],
                ).paddedB(12.0.h);
              }).toList(),
            ],
          )),
        ),
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
