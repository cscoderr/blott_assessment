import 'package:blott_assessment/domain/domain.dart';

class GetMarketNewsUsecase implements Usecases<NoParams, void> {
  const GetMarketNewsUsecase(this.repository);
  final HomeRepository repository;
  @override
  Future<List<MarketNewsEntity>> call([NoParams params = const NoParams()]) {
    return repository.getMarketNews();
  }
}
