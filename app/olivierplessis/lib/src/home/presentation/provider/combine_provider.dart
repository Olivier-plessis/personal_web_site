import 'package:olivierplessis/src/home/domain/model/about/about_model.dart';
import 'package:olivierplessis/src/home/domain/model/contact/contact_model.dart';
import 'package:olivierplessis/src/home/domain/model/header/header_model.dart';
import 'package:olivierplessis/src/home/domain/model/main_model.dart';
import 'package:olivierplessis/src/home/domain/model/portfolio/portfolio_model.dart';
import 'package:olivierplessis/src/home/presentation/provider/parts/about/about_data_provider.dart';
import 'package:olivierplessis/src/home/presentation/provider/parts/contact/contact_data_provider.dart';
import 'package:olivierplessis/src/home/presentation/provider/parts/header/header_data_provider.dart';
import 'package:olivierplessis/src/home/presentation/provider/parts/portfolio/portfolio_data_provider.dart';
import 'package:olivierplessis/src/navigation/presentation/provider/item_nav_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'combine_provider.g.dart';

@riverpod
class AsyncCombineNotifier extends _$AsyncCombineNotifier {
  @override
  FutureOr<MainModel?> build() async {
    await Future.wait<dynamic>([
      ref.watch(itemNavListProvider.future),
      ref.watch(headerDataProvider.future),
      ref.watch(aboutDataProvider.future),
      ref.watch(portfolioDataProvider.future),
      ref.watch(contactDataProvider.future),
    ]);
    return MainModel(
      navigation: ref.watch(itemNavListProvider).value ?? [],
      header: ref.watch(headerDataProvider).value ?? HeaderSection.empty(),
      about: ref.watch(aboutDataProvider).value ?? AboutSection.empty(),
      portfolio:
          ref.watch(portfolioDataProvider).value ?? PortfolioSection.empty(),
      contact: ref.watch(contactDataProvider).value ?? ContactSection.empty(),
    );
  }
}
