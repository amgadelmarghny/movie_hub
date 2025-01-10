import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_hub/core/error/failure.dart';

abstract class BaseMovieUsecase<T, Parameters> {
  Future<Either<Failure, T>> call(Parameters parameters);
}

class NoParameters extends Equatable {
  const NoParameters();

  @override
  List<Object?> get props => [];
}
