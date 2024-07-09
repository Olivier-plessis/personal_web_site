import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:olivierplessis/core/utils/extension/responsive_extension.dart';
import 'package:olivierplessis/core/utils/provider/theme/theme_mode_provider.dart';
import 'package:olivierplessis/src/home/presentation/layout/header_layout.dart';
import 'package:olivierplessis/src/navigation/presentation/provider/selected_item_tool_bar_provider.dart';
import 'package:olivierplessis/src/navigation/presentation/widget/app_bar_widget.dart';
import 'package:olivierplessis/src/navigation/presentation/widget/tool_bar_item.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final ItemScrollController _itemScrollController = ItemScrollController();

  @override
  Widget build(
    BuildContext context,
  ) {
    final List<ToolbarItem> toolbarItems = _generateToolbarItem();
    final selectedIndex = ref.watch(selectedToolbarIndexProvider);
    final ThemeMode themeMode = ref.watch(themeModeControllerProvider);

    return Scaffold(
      /* endDrawer: Drawer(
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
      ),*/
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight * 2),
        child: AppBarWidget(
            toolbarItems: toolbarItems, selectedIndex: selectedIndex, themeMode: themeMode),
      ),
      body: _bodyItems.isEmpty ? const SizedBox.shrink() : _body(),
    );
  }

  Widget _body() {
    return ScrollablePositionedList.builder(
      itemCount: _bodyItems.length,
      itemBuilder: (context, index) => _bodyItems[index],
      itemScrollController: _itemScrollController,
    );
  }

  List<ToolbarItem> _generateToolbarItem() {
    return [
      ToolbarItem(text: 'Accueil', onTap: () => _changeToIndex(1)),
      ToolbarItem(text: 'A propos', onTap: () => _changeToIndex(2)),
      ToolbarItem(text: 'Réalisations', onTap: () => _changeToIndex(3)),
      ToolbarItem(text: 'Contact', onTap: () => _changeToIndex(4)),
    ];
  }

  List<Widget> get _bodyItems => [
        const BlockWrapper(HeaderLayout()),
      ];

  void _changeToIndex(int i) {
    _itemScrollController.scrollTo(
      index: i,
      duration: const Duration(milliseconds: 300),
    );
  }
}
