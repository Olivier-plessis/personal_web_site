import 'package:olivierplessis/src/home/data/repository/data_repository.dart';
import 'package:olivierplessis/src/home/domain/model/about/about_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'about_data_provider.g.dart';

@Riverpod(keepAlive: true)
class AboutDataClient extends _$AboutDataClient {
  @override
  Future<DataRepository> build() async {
    return DataRepository();
  }
}

@Riverpod(keepAlive: true)
class AboutData extends _$AboutData {
  @override
  FutureOr<AboutSection> build() async {
    final aboutSection = await ref.watch(aboutDataClientProvider.future);

    return aboutSection.getAboutSection();
  }
}
