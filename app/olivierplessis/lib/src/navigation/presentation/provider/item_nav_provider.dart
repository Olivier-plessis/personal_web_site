import 'package:olivierplessis/src/home/data/repository/data_repository.dart';
import 'package:olivierplessis/src/navigation/domain/model/item_nav_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'item_nav_provider.g.dart';

@Riverpod(keepAlive: true)
class NavigationClient extends _$NavigationClient {
  @override
  Future<DataRepository> build() async {
    return DataRepository();
  }
}

@Riverpod(keepAlive: true)
class NavigationData extends _$NavigationData {
  @override
  FutureOr<List<Navigation>?> build() async {
    final navigationSection = await ref.watch(navigationClientProvider.future);

    return navigationSection.getNavigation();
  }
}
