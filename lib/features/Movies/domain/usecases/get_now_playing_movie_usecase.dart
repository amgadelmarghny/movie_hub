import 'package:dartz/dartz.dart';
import 'package:movie_hub/core/base_usecases/base_movie_usecase.dart';
import 'package:movie_hub/core/error/failure.dart';
import 'package:movie_hub/features/Movies/domain/entities/movie.dart';
import 'package:movie_hub/features/Movies/domain/repositories/base_movie_repo.dart';

class GetNowPlayingMovieUsecase
    implements BaseMovieUsecase<List<Movie>, NoParameters> {
  final BaseMoviesRepo baseMoviesRepo;

  GetNowPlayingMovieUsecase({required this.baseMoviesRepo});

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters noParameter) async {
    final response = await baseMoviesRepo.getNowPlayingMovies();
    return response;
  }
}
