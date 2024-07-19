import 'package:design_ui/design_ui.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:olivierplessis/core/utils/extension/responsive_extension.dart';
import 'package:olivierplessis/core/utils/provider/theme/theme_mode_provider.dart';
import 'package:olivierplessis/src/navigation/presentation/provider/selected_item_tool_bar_provider.dart';
import 'package:olivierplessis/src/navigation/presentation/widget/tool_bar_item.dart';
import 'package:responsive_framework/responsive_framework.dart';

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
      automaticallyImplyLeading: false,
      title: SafeArea(
        child: BlockWrapperCenter(
          Container(
            width: MaxSizeConstant.maxWidth,
            margin: EdgeInsets.only(top: 56, bottom: 45),
            padding: blockPadding(context),
            child: Row(
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
                      : StyleTextTheme.textThemeDisplayMedium
                          .copyWith(letterSpacing: 1.2),
                ),
                Text(
                  ' PLESSIS',
                  style: context.isDisplayLargeThanTablet
                      ? StyleTextTheme.textThemeDisplayMedium
                          .copyWith(letterSpacing: 1.8, color: Palette.teal)
                      : StyleTextTheme.textThemeDisplayMedium
                          .copyWith(letterSpacing: 1.2, color: Palette.teal),
                ),
                const Spacer(),
                ResponsiveVisibility(
                  visible: false,
                  visibleConditions: const [Condition.largerThan(name: TABLET)],
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...toolbarItems.fold<List<Widget>>(
                          [],
                          (widgetValue, item) {
                            final index = widgetValue
                                .length; // Index based on current list length
                            widgetValue.add(
                              InkWell(
                                splashFactory: NoSplash.splashFactory,
                                highlightColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: () {
                                  ref
                                      .read(
                                          selectedToolbarIndexProvider.notifier)
                                      .state = index;
                                  item.onTap?.call();
                                },
                                child: Text(
                                  item.text,
                                  style: StyleTextTheme.titleMedium.copyWith(
                                    fontWeight: FontWeightTheme.medium,
                                    color: selectedIndex == index
                                        ? Palette.teal
                                        : ThemeMode.dark ==
                                                ref.watch(
                                                    themeModeControllerProvider)
                                            ? Palette.grey
                                            : Palette.greyDark,
                                  ),
                                ),
                              ).paddedH(12),
                            );
                            return widgetValue;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                ResponsiveVisibility(
                  visible: false,
                  visibleConditions: const [Condition.largerThan(name: TABLET)],
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: IconButton(
                      onPressed: () => ref
                          .watch(themeModeControllerProvider.notifier)
                          .toggleThemeMode(),
                      icon: Icon(themeMode == ThemeMode.light
                          ? Icons.dark_mode
                          : Icons.light_mode),
                    ).paddedL(24),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
