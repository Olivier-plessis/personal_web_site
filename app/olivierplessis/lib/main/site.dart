import 'package:design_ui/design_ui.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:olivierplessis/core/utils/extension/responsive_extension.dart';
import 'package:olivierplessis/core/utils/provider/theme/theme_icon_provider.dart';
import 'package:olivierplessis/core/utils/provider/theme/theme_mode_provider.dart';
import 'package:olivierplessis/src/navigation/presentation/provider/selected_item_tool_bar_provider.dart';
import 'package:olivierplessis/src/navigation/presentation/widget/tool_bar_item.dart';
import 'package:olivierplessis/src/routing/app_router.dart';
import 'package:responsive_framework/responsive_framework.dart';

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeMode themeMode = ref.watch(themeModeControllerProvider);

    final theme = themeMode == ThemeMode.light ? lightTheme : darkTheme;
    final goRouter = ref.watch(goRouterProvider);

    return MaterialApp.router(
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
          breakpoints: [
            const Breakpoint(start: 0, end: 360, name: 'SMALL_MOBILE'),
            const Breakpoint(start: 361, end: 450, name: MOBILE),
            const Breakpoint(start: 451, end: 1024, name: TABLET),
            const Breakpoint(start: 801, end: 1920, name: DESKTOP),
            const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
          ],
          child: child ?? const SizedBox.shrink(),
        ),
      ),
    );
  }
}

class MainNavigationBar extends ConsumerWidget {
  final List<ToolbarItem> toolbarItems;
  final VoidCallback onPressed;

  const MainNavigationBar({super.key, required this.toolbarItems, required this.onPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedToolbarIndexProvider);
    final themeModeIcon = ref.watch(themeModeIconProvider);
    return AppBar(
      centerTitle: false,
      titleSpacing: 32,
      titleTextStyle: Theme.of(context).textTheme.titleSmall,
      scrolledUnderElevation: 4,
      shadowColor: Colors.grey.shade50.withOpacity(0.2),
      title: Center(
        child: MaxWidthBox(
            maxWidth: MaxSizeConstant.maxWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('OLIVIER PLESSIS',
                    style: context.isDisplayLargeThanTablet
                        ? siteTextTheme.displayMedium?.copyWith(letterSpacing: 0.8)
                        : siteTextTheme.titleMedium?.copyWith(letterSpacing: 0.8)),
                if (context.isDisplayLargeThanTablet)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...toolbarItems.map((item) {
                        return InkWell(
                          splashFactory: NoSplash.splashFactory,
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            ref.read(selectedToolbarIndexProvider.notifier).update(
                                (state) => state = toolbarItems.indexOf(item)); // Update index

                            item.onTap?.call();
                          },
                          child: Text(item.text,
                              style: siteTextTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeightTheme.medium,
                                  color: selectedIndex == toolbarItems.indexOf(item)
                                      ? Palette.violet
                                      : ThemeMode.dark == ref.watch(themeModeControllerProvider)
                                          ? Palette.grey
                                          : Palette.greyDark) // Active color
                              ),
                        ).paddedH(12);
                      }),
                      IconButton(
                        onPressed: onPressed,
                        icon: Icon(themeModeIcon),
                      ).paddedL(24),
                    ],
                  ),
              ],
            )),
      ),
    );
  }
}
