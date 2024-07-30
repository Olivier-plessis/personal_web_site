import 'package:olivierplessis/src/home/data/repository/data_repository.dart';
import 'package:olivierplessis/src/home/domain/model/header/header_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'header_data_provider.g.dart';

@Riverpod(keepAlive: true)
class HeaderDataClient extends _$HeaderDataClient {
  @override
  Future<DataRepository> build() async {
    return DataRepository();
  }
}

@Riverpod(keepAlive: true)
class HeaderData extends _$HeaderData {
  @override
  FutureOr<HeaderSection> build() async {
    final headerSection = await ref.watch(headerDataClientProvider.future);

    return headerSection.getHeaderSection();
  }
}
