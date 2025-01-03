import 'package:dartz/dartz.dart';
import 'package:movie_hub/core/error/failure.dart';
import 'package:movie_hub/features/Movies/domain/entities/movie.dart';
import 'package:movie_hub/features/Movies/domain/repositories/base_movie_repo.dart';

class GetNowPlayingMovieUsecase {
  final BaseMoviesRepo baseMoviesRepo;

  GetNowPlayingMovieUsecase({required this.baseMoviesRepo});

  Future<Either<Failure, List<Movie>>> execute() async {
    final response = await baseMoviesRepo.getNowPlayingMovies();
    return response;
  }
}
