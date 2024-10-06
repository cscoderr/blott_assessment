import 'dart:io';

import 'package:blott_assessment/data/data.dart';
import 'package:dio/dio.dart';

class HomeException implements Exception {
  const HomeException();
}

abstract class HomeRemoteDatasource {
  Future<List<MarketNewsModel>> getMarketNews();
}

class HomeRemoteDatasourceImpl implements HomeRemoteDatasource {
  HomeRemoteDatasourceImpl({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<List<MarketNewsModel>> getMarketNews() async {
    const apiKey = String.fromEnvironment('API_KEY');
    final response =
        await dio.get<dynamic>('/news?category=general&token=$apiKey');
    if (response.statusCode == HttpStatus.ok) {
      if ((response.data as List<dynamic>?) != null) {
        throw const HomeException();
      }
      final data = response.data as List<dynamic>?;
      return data
              ?.map((e) => MarketNewsModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [];
    }
    throw Exception('Something went wrong, please try again later.');
  }
}
