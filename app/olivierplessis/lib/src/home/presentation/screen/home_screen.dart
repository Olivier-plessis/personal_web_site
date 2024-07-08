import 'package:design_ui/design_ui.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:olivierplessis/core/utils/extension/responsive_extension.dart';
import 'package:olivierplessis/core/utils/provider/theme/theme_mode_provider.dart';
import 'package:olivierplessis/src/navigation/presentation/provider/selected_item_tool_bar_provider.dart';
import 'package:olivierplessis/src/navigation/presentation/widget/tool_bar_item.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final List<ToolbarItem> toolbarItems = _generateToolbarItem();
    final selectedIndex = ref.watch(selectedToolbarIndexProvider);
    final ThemeMode themeMode = ref.watch(themeModeControllerProvider);

    return Scaffold(
      endDrawer: Drawer(
        child: Column(
          children: [
            const SizedBox(height: 12),
            const Text('Drawer'),
            const SizedBox(height: 12),
            ElevatedButton(
              child: const Text('change color theme'),
              onPressed: () => ref.watch(themeModeControllerProvider.notifier).toggleThemeMode(),
            ),
          ],
        ),
      ),
      appBar: AppBar(
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
                              ref.read(selectedToolbarIndexProvider.notifier).state =
                                  toolbarItems.indexOf(item); // Update index
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
                          onPressed: () =>
                              ref.watch(themeModeControllerProvider.notifier).toggleThemeMode(),
                          icon: Icon(
                              themeMode == ThemeMode.light ? Icons.dark_mode : Icons.light_mode),
                        ).paddedL(24),
                      ],
                    ),
                ],
              )),
        ),
      ),
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

  List<ToolbarItem> _generateToolbarItem() {
    return [
      ToolbarItem(text: 'Accueil', onTap: () => print(1)),
      ToolbarItem(text: 'A propos', onTap: () => print(2)),
      ToolbarItem(text: 'Réalisations', onTap: () => print(3)),
      ToolbarItem(text: 'Contact', onTap: () => print(6)),
    ];
  }
}
