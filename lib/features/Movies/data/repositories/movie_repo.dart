import 'package:movie_hub/core/error/failure.dart';
import 'package:movie_hub/core/network/server_exception.dart';
import 'package:movie_hub/features/Movies/data/datasources/remote/movie_remote_data_source.dart';
import 'package:movie_hub/features/Movies/domain/entities/movie.dart';
import 'package:movie_hub/features/Movies/domain/repositories/base_movie_repo.dart';
import 'package:dartz/dartz.dart';

class MovieRepo implements BaseMoviesRepo {
  final BaseMovieDataSource baseMovieDataSource;

  MovieRepo({required this.baseMovieDataSource});

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    final result = await baseMovieDataSource.getNowPlayingMovies();
    try {
      return Right(result);
    } on ServerException catch (exception) {
      return Left(ServerFailure(message: exception.errorModel.message));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result = await baseMovieDataSource.getPopularMovies();
    try {
      return Right(result);
    } on ServerException catch (exception) {
      return Left(ServerFailure(message: exception.errorModel.message));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final result = await baseMovieDataSource.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerException catch (exception) {
      return Left(ServerFailure(message: exception.errorModel.message));
    }
  }
}
