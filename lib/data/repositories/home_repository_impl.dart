import 'package:blott_assessment/core/utils/app_exception.dart';
import 'package:blott_assessment/data/data.dart';
import 'package:blott_assessment/data/datasources/datasources.dart';
import 'package:blott_assessment/domain/domain.dart';
import 'package:freezed_result/freezed_result.dart';

class HomeRepositoryImpl implements HomeRepository {
  const HomeRepositoryImpl({required HomeRemoteDatasource homeRemoteDatasource})
      : _homeRemoteDatasource = homeRemoteDatasource;

  final HomeRemoteDatasource _homeRemoteDatasource;
  @override
  Future<Result<List<MarketNewsEntity>, Exception>> getMarketNews() async {
    try {
      final response = await _homeRemoteDatasource.getMarketNews();
      return Result.success(response.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Result.failure(AppException(e.toString()));
    }
  }
}
