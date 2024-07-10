import 'package:design_ui/design_ui.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:olivierplessis/core/utils/provider/theme/theme_mode_provider.dart';
import 'package:olivierplessis/src/routing/app_router.dart';
import 'package:responsive_framework/responsive_framework.dart';

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeMode themeMode = ref.watch(themeModeControllerProvider);

    final theme = themeMode == ThemeMode.light ? lightTheme : darkTheme;
    final goRouter = ref.watch(goRouterProvider);

    return ScreenUtilInit(
      designSize: ScreenUtil.defaultSize,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => MaterialApp.router(
        routerConfig: goRouter,
        title: 'olivier plessis | Freelance Flutter developer',
        debugShowCheckedModeBanner: false,
        theme: theme,
        darkTheme: theme,
        themeMode: themeMode,
        builder: (
          BuildContext context,
          Widget? child,
        ) =>
            MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: const TextScaler.linear(1),
          ),
          child: ResponsiveBreakpoints.builder(
            child: Builder(builder: (context) {
              return ResponsiveScaledBox(
                  width: ResponsiveValue<double?>(context, defaultValue: null, conditionalValues: [
                    const Condition.equals(name: 'MOBILE_SMALL', value: 480),
                  ]).value,
                  child: ClampingScrollWrapper.builder(
                    context,
                    child ?? const SizedBox.shrink(),
                  ));
            }),
            breakpoints: [
              const Breakpoint(start: 0, end: 360, name: 'MOBILE_SMALL'),
              const Breakpoint(start: 361, end: 640, name: MOBILE),
              const Breakpoint(start: 640, end: 1024, name: TABLET),
              const Breakpoint(start: 1024, end: 1920, name: DESKTOP),
              const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
            ],
          ),
        ),
      ),
    );
  }
}
