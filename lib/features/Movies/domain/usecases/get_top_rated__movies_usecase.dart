import 'package:dartz/dartz.dart';
import 'package:movie_hub/core/error/failure.dart';
import 'package:movie_hub/features/Movies/domain/entities/movie.dart';
import 'package:movie_hub/features/Movies/domain/repositories/base_movie_repo.dart';

class GetTopMoviesUsecase {
  final BaseMoviesRepo baseMoviesRepo;

  GetTopMoviesUsecase({required this.baseMoviesRepo});

Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    final response = await baseMoviesRepo.getTopRatedMovies();
    return response;
  }
}
