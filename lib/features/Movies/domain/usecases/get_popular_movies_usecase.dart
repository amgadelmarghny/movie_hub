import 'package:movie_hub/features/Movies/domain/entities/movie.dart';
import 'package:movie_hub/features/Movies/domain/repositories/base_movie_repo.dart';

class GetPopularMoviesUsecase {
  final BaseMoviesRepo baseMoviesRepo;

  GetPopularMoviesUsecase({required this.baseMoviesRepo});

  Future<List<Movie>> getPoularMovies() async {
    final response = await baseMoviesRepo.getPopularMovies();
    return response;
  }
}
