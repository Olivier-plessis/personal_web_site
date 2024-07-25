import 'package:design_ui/design_ui.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:olivierplessis/core/utils/extension/responsive_extension.dart';
import 'package:olivierplessis/src/routing/app_router.dart';
import 'package:olivierplessis/src/routing/route_constant.dart';

class LandingScreen extends ConsumerStatefulWidget {
  const LandingScreen({super.key});

  @override
  ConsumerState<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends ConsumerState<LandingScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      ref.read(goRouterProvider).goNamed(AppPage.home.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Palette.surfaceBackgroundDark,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImagePictureCustom(
                path: IconAssets.icGreenLogo,
                width: 64,
                height: 54,
              ),
              Text(
                'OLIVIER',
                style: context.isDisplayLargeThanTablet
                    ? StyleTextTheme.textThemeDisplayMedium
                        .copyWith(letterSpacing: 1.8)
                    : StyleTextTheme.textThemeDisplayMedium.copyWith(
                        letterSpacing: 1.2,
                        fontSize: MediaQuery.of(context).size.width * 0.06),
              ),
              Text(
                ' PLESSIS',
                style: context.isDisplayLargeThanTablet
                    ? StyleTextTheme.textThemeDisplayMedium
                        .copyWith(letterSpacing: 1.8, color: Palette.teal)
                    : StyleTextTheme.textThemeDisplayMedium.copyWith(
                        letterSpacing: 1.2,
                        color: Palette.teal,
                        fontSize: MediaQuery.of(context).size.width * 0.06),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
