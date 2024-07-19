import 'package:design_ui/design_ui.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:olivierplessis/core/utils/extension/responsive_extension.dart';
import 'package:olivierplessis/core/utils/provider/theme/theme_mode_provider.dart';
import 'package:olivierplessis/src/home/domain/model/main_model.dart';
import 'package:olivierplessis/src/home/presentation/layout/about/about_layout.dart';
import 'package:olivierplessis/src/home/presentation/layout/contact/contact_layout.dart';
import 'package:olivierplessis/src/home/presentation/layout/header/header_layout.dart';
import 'package:olivierplessis/src/home/presentation/layout/portfolio/portfolio_layout.dart';
import 'package:olivierplessis/src/home/presentation/provider/combine_provider.dart';
import 'package:olivierplessis/src/navigation/domain/model/item_nav_model.dart';
import 'package:olivierplessis/src/navigation/presentation/provider/selected_item_tool_bar_provider.dart';
import 'package:olivierplessis/src/navigation/presentation/widget/app_bar_widget.dart';
import 'package:olivierplessis/src/navigation/presentation/widget/tool_bar_item.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MainHomeScreen extends ConsumerWidget {
  const MainHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncCombineHomeData = ref.watch(asyncCombineNotifierProvider);

    return switch (asyncCombineHomeData) {
      AsyncData(:final value) => HomeScreen(homeData: value),
      AsyncError(:final error) => Text('Error: $error'),
      _ => const SizedBox.shrink(),
    };
  }
}

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key, required this.homeData});
  final MainModel? homeData;
  @override
  ConsumerState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final ItemScrollController _itemScrollController = ItemScrollController();

  @override
  Widget build(BuildContext context) {
    final selectedIndex = ref.watch(selectedToolbarIndexProvider);
    final ThemeMode themeMode = ref.watch(themeModeControllerProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: AppBarWidget(
              toolbarItems:
                  _generateToolbarItems(widget.homeData?.navigation ?? []),
              selectedIndex: selectedIndex,
              themeMode: themeMode)),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: <Widget>[
              _buildBackground(),
              _bodyItems.isEmpty ? const SizedBox.shrink() : _body(),
            ],
          );
        },
      ),
    );
  }

  List<ToolbarItem> _generateToolbarItems(List<Navigation> navigationList) {
    return navigationList
        .expand((navigation) =>
            navigation.items.asMap().entries.map((entry) => ToolbarItem(
                  text: entry.value.title,
                  onTap: () => _changeToIndex(entry.key),
                )))
        .toList();
  }

  void _changeToIndex(int i) {
    _itemScrollController.scrollTo(
      index: i,
      duration: const Duration(milliseconds: 900),
    );
  }

  Widget _buildBackground() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        ...List.generate(
          5,
          (index) => _buildVerticalDivider(),
        ).toList(),
      ],
    );
  }

  Widget _buildVerticalDivider() {
    return VerticalDivider(
      width: 2,
      color: Palette.tealDarkLighten.withOpacity(0.2),
    );
  }

  List<Widget> get _bodyItems => [
        BlockWrapperWithContainer(
            isTop: true, HeaderLayout(headerData: widget.homeData!.header)),
        BlockWrapperWithContainer(
            AboutLayout(aboutData: widget.homeData!.about)),
        BlockWrapperWithContainer(
            PortfolioLayout(portfolio: widget.homeData!.portfolio)),
        BlockWrapperWithContainer(
            ContactLayout(contactData: widget.homeData!.contact)),
      ];

  Widget _body() {
    return ScrollablePositionedList.builder(
      itemCount: _bodyItems.length,
      itemBuilder: (context, index) => _bodyItems[index],
      itemScrollController: _itemScrollController,
    );
  }

  /* Widget? _drawer(BuildContext context) {
    if (context.isDisplayLargeThanTablet) return null;

    return Column(
      children: [
        const SizedBox(height: 12),
        const Text('Drawer'),
        const SizedBox(height: 12),
        ElevatedButton(
          child: const Text('change color theme'),
          onPressed: () =>
              ref.watch(themeModeControllerProvider.notifier).toggleThemeMode(),
        ),
      ],
    );
  }*/
}
