import 'package:bloc/bloc.dart';
import 'package:blott_assessment/domain/domain.dart';
import 'package:equatable/equatable.dart';

part 'market_news_state.dart';

class MarketNewsCubit extends Cubit<MarketNewsState> {
  MarketNewsCubit({
    required GetMarketNewsUsecase getMarketNewsUsecase,
  })  : _getMarketNewsUsecase = getMarketNewsUsecase,
        super(MarketNewsInitial());

  final GetMarketNewsUsecase _getMarketNewsUsecase;

  Future<void> getMarketNews({bool isRefresh = false}) async {
    if (!isRefresh) {
      emit(MarketNewsLoading());
    }
    final response = await _getMarketNewsUsecase();
    response.when(
      success: (data) {
        emit(MarketNewsSuccess(data));
      },
      failure: (error) {
        emit(MarketNewsFailure(error.toString()));
      },
    );
  }
}
