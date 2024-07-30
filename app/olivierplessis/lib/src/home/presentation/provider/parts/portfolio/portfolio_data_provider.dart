import 'package:olivierplessis/src/home/data/repository/data_repository.dart';
import 'package:olivierplessis/src/home/domain/model/portfolio/portfolio_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'portfolio_data_provider.g.dart';

@Riverpod(keepAlive: true)
class CurrentWorkCollection extends _$CurrentWorkCollection {
  @override
  PortfolioSection build() {
    return PortfolioSection.empty();
  }
}

@Riverpod(keepAlive: true)
class PortfolioDataClient extends _$PortfolioDataClient {
  @override
  Future<DataRepository> build() async {
    return DataRepository();
  }
}

@Riverpod(keepAlive: true)
class PortfolioData extends _$PortfolioData {
  @override
  FutureOr<PortfolioSection> build() async {
    final portfolioSection =
        await ref.watch(portfolioDataClientProvider.future);

    return portfolioSection.getPortfolioSection();
  }
}
