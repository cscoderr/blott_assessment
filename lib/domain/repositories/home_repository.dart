import 'package:blott_assessment/domain/domain.dart';
import 'package:freezed_result/freezed_result.dart';

abstract class HomeRepository {
  Future<Result<List<MarketNewsEntity>, Exception>> getMarketNews();
}
