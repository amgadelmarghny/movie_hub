import 'package:movie_hub/features/Movies/domain/entities/movie.dart';

abstract class BaseMoviesRepo {
  Future<List<Movie>> getNowPlayingMovies();

  Future<List<Movie>> getPopularMovies();

  Future<List<Movie>> getTopRatedMovies();
}
