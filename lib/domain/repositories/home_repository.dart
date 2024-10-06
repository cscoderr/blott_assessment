import 'package:blott_assessment/domain/domain.dart';

abstract class HomeRepository {
  Future<List<MarketNewsEntity>> getMarketNews();
}
