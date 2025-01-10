import 'package:dartz/dartz.dart';
import 'package:movie_hub/core/error/failure.dart';

abstract class BaseMovieUsecase<T> {
  Future<Either<Failure, T>> call();
}
