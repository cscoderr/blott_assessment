import 'package:blott_assessment/data/data.dart';
import 'package:blott_assessment/data/datasources/datasources.dart';
import 'package:blott_assessment/domain/domain.dart';

class HomeRepositoryImpl implements HomeRepository {
  const HomeRepositoryImpl({required HomeRemoteDatasource homeRemoteDatasource})
      : _homeRemoteDatasource = homeRemoteDatasource;

  final HomeRemoteDatasource _homeRemoteDatasource;
  @override
  Future<List<MarketNewsEntity>> getMarketNews() async {
    try {
      final response = await _homeRemoteDatasource.getMarketNews();
      return response.map((e) => e.toEntity()).toList();
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
