import 'package:movie_hub/features/Movies/domain/entities/movie.dart';

abstract class BaseMoviesRepo {
  Future<List<Movie>> getNowPlaying();

  Future<List<Movie>> getPopular();

  Future<List<Movie>> getTopRated();
}
