import 'package:dartz/dartz.dart';
import 'package:movie_hub/core/error/failure.dart';
import 'package:movie_hub/features/Movies/domain/entities/movie.dart';
import 'package:movie_hub/features/Movies/domain/entities/movie_details.dart';
import 'package:movie_hub/features/Movies/domain/entities/movie_recommendation.dart';

abstract class BaseMoviesRepo {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();

  Future<Either<Failure, List<Movie>>> getPopularMovies();

  Future<Either<Failure, List<Movie>>> getTopRatedMovies();

  Future<Either<Failure, MovieDetails>> getMovieDetails(
      {required int movieId});
  Future<Either<Failure, List<MovieRecommendation>>> getMovieRecommendations(
      {required int movieId});
}
