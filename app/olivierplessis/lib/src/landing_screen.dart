import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
/*    Future.delayed(const Duration(seconds: 1), () {
      ref.read(goRouterProvider).goNamed(AppPage.home.routeName);
    });*/
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.read(goRouterProvider).goNamed(AppPage.home.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: const Center(
        child: Text('LandingScreen'),
      ),
    );
  }
}
