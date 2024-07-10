import 'package:olivierplessis/src/home/domain/model/main_model.dart';
import 'package:olivierplessis/src/navigation/presentation/provider/item_nav_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'combine_provider.g.dart';

@riverpod
class AsyncCombineNotifier extends _$AsyncCombineNotifier {
  @override
  FutureOr<MainModel?> build() async {
    await Future.wait<dynamic>([
      ref.watch(itemNavListProvider.future),
    ]);
    return MainModel(
      navigation: ref.watch(itemNavListProvider).value ?? [],
    );
  }
}
