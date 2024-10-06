part of 'market_news_cubit.dart';

sealed class MarketNewsState extends Equatable {
  const MarketNewsState();

  @override
  List<Object> get props => [];
}

final class MarketNewsInitial extends MarketNewsState {}

final class MarketNewsLoading extends MarketNewsState {}

final class MarketNewsSuccess extends MarketNewsState {
  const MarketNewsSuccess(this.data);
  final List<MarketNewsEntity> data;
}

final class MarketNewsFailure extends MarketNewsState {
  const MarketNewsFailure(this.errorMessage);
  final String errorMessage;
}
