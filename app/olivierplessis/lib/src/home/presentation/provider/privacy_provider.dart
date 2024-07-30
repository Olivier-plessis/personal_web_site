import 'package:olivierplessis/src/home/data/repository/data_repository.dart';
import 'package:olivierplessis/src/home/domain/model/privacy/privacy_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'privacy_provider.g.dart';

@riverpod
class PrivacyDataClient extends _$PrivacyDataClient {
  @override
  Future<DataRepository> build() async {
    return DataRepository();
  }
}

@riverpod
class PrivacyData extends _$PrivacyData {
  @override
  FutureOr<PrivacyModel> build() async {
    final privacySection = await ref.watch(privacyDataClientProvider.future);

    return privacySection.getPrivacy();
  }
}
