import 'package:movie_hub/features/Movies/domain/entities/movie.dart';
import 'package:movie_hub/features/Movies/domain/repositories/base_movie_repo.dart';

class GetTopMoviesUsecase {
  final BaseMoviesRepo baseMoviesRepo;

  GetTopMoviesUsecase({required this.baseMoviesRepo});

  Future<List<Movie>> getNowPlayingMovie() async {
    final response = await baseMoviesRepo.getTopRatedMovies();
    return response;
  }
}
