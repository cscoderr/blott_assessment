import 'package:equatable/equatable.dart';
import 'package:freezed_result/freezed_result.dart';

abstract class Usecases<T, P> {
  Future<Result<T, Exception>> call(P params);
}

class NoParams extends Equatable {
  const NoParams();

  @override
  List<Object?> get props => [];
}
