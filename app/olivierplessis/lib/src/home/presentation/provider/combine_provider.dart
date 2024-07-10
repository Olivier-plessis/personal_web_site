import 'package:olivierplessis/src/home/domain/model/about/about_model.dart';
import 'package:olivierplessis/src/home/domain/model/main_model.dart';
import 'package:olivierplessis/src/home/presentation/provider/parts/about_data_provider.dart';
import 'package:olivierplessis/src/home/presentation/provider/parts/header_data_provider.dart';
import 'package:olivierplessis/src/navigation/presentation/provider/item_nav_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/model/header/header_model.dart';

part 'combine_provider.g.dart';

@riverpod
class AsyncCombineNotifier extends _$AsyncCombineNotifier {
  @override
  FutureOr<MainModel?> build() async {
    await Future.wait<dynamic>([
      ref.watch(itemNavListProvider.future),
      ref.watch(headerDataProvider.future),
      ref.watch(aboutDataProvider.future),
    ]);
    return MainModel(
      navigation: ref.watch(itemNavListProvider).value ?? [],
      header: ref.watch(headerDataProvider).value ?? HeaderSection.empty(),
      about: ref.watch(aboutDataProvider).value ?? AboutSection.empty(),
    );
  }
}
