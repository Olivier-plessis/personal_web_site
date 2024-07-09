import 'package:design_ui/design_ui.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:olivierplessis/core/utils/extension/responsive_extension.dart';
import 'package:olivierplessis/core/utils/provider/theme/theme_mode_provider.dart';
import 'package:olivierplessis/src/navigation/presentation/provider/selected_item_tool_bar_provider.dart';
import 'package:olivierplessis/src/navigation/presentation/widget/tool_bar_item.dart';

class AppBarWidget extends ConsumerWidget {
  const AppBarWidget({
    super.key,
    required this.toolbarItems,
    required this.selectedIndex,
    required this.themeMode,
  });

  final List<ToolbarItem> toolbarItems;
  final int selectedIndex;
  final ThemeMode themeMode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      centerTitle: false,
      titleSpacing: 0,
      titleTextStyle: Theme.of(context).textTheme.titleSmall,
      scrolledUnderElevation: 4,
      shadowColor: Colors.grey.shade50.withOpacity(0.2),
      title: BlockWrapper(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                SvgPictureCustom(
                  path: IconAssets.icLogo,
                  width: 64,
                  height: 64,
                ),
                Text(
                  'OLIVIER',
                  style: context.isDisplayLargeThanTablet
                      ? StyleTextTheme.TextThemeDisplayLarge.copyWith(letterSpacing: 1.8)
                      : StyleTextTheme.TextThemeDisplayMedium.copyWith(letterSpacing: 1.2),
                ),
                Text(
                  ' PLESSIS',
                  style: context.isDisplayLargeThanTablet
                      ? StyleTextTheme.TextThemeDisplayLarge.copyWith(
                          letterSpacing: 1.8, color: Palette.violet)
                      : StyleTextTheme.TextThemeDisplayMedium.copyWith(
                          letterSpacing: 1.2, color: Palette.violet),
                ),
              ],
            ),
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
                          style: StyleTextTheme.titleMedium?.copyWith(
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
                    icon: Icon(themeMode == ThemeMode.light ? Icons.dark_mode : Icons.light_mode),
                  ).paddedL(24),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
