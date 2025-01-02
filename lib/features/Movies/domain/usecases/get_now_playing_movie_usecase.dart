import 'package:movie_hub/features/Movies/domain/entities/movie.dart';
import 'package:movie_hub/features/Movies/domain/repositories/base_movie_repo.dart';

class GetNowPlayingMovieUsecase {
  final BaseMoviesRepo baseMoviesRepo;

  GetNowPlayingMovieUsecase({required this.baseMoviesRepo});

  Future<List<Movie>> getNowPlayingMovies() async {
    final response = await baseMoviesRepo.getNowPlayingMovies();
    return response;
  }
}
