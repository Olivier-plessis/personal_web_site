import 'package:design_ui/design_ui.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:olivierplessis/core/utils/extension/responsive_extension.dart';
import 'package:olivierplessis/core/utils/provider/theme_mode_provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeMode themeMode = ref.watch(themeModeControllerProvider);

    final theme = themeMode == ThemeMode.light ? lightTheme : darkTheme;

    return MaterialApp(
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
          breakpoints: [
            const Breakpoint(start: 0, end: 360, name: 'SMALL_MOBILE'),
            const Breakpoint(start: 361, end: 450, name: MOBILE),
            const Breakpoint(start: 451, end: 800, name: TABLET),
            const Breakpoint(start: 801, end: 1920, name: DESKTOP),
            const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
          ],
          child: HomeScreen() ?? const SizedBox.shrink(),
        ),
      ),
    );
  }
}

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    List<int> evenNumbers = List.generate(1000, (index) => 2 * (index + 1));

    return Scaffold(
      appBar: _appBar(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('toggle theme mode'),
            const SizedBox(height: 12),
            ElevatedButton(
              child: const Text('change color theme'),
              onPressed: () => ref.watch(themeModeControllerProvider.notifier).toggleThemeMode(),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: Center(
        child: MaxWidthBox(
          maxWidth: MaxSizeConstant.maxWidth,
          child: context.isDisplayLargeThanTablet
              ? Text('OLIVIER PLESSIS',
                  style: siteTextTheme.displayLarge?.copyWith(letterSpacing: 0.8))
              : Text('pouet'),
        ),
      ),
    );
  }
}
