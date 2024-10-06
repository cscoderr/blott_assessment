import 'package:blott_assessment/core/core.dart';
import 'package:blott_assessment/domain/domain.dart';
import 'package:freezed_result/freezed_result.dart';

class GetMarketNewsUsecase implements Usecases<void, NoParams> {
  const GetMarketNewsUsecase(this.repository);
  final HomeRepository repository;
  @override
  Future<Result<List<MarketNewsEntity>, Exception>> call([
    NoParams params = const NoParams(),
  ]) {
    return repository.getMarketNews();
  }
}
