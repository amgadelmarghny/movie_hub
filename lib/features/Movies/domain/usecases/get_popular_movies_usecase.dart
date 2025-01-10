import 'package:dartz/dartz.dart';
import 'package:movie_hub/core/base_usecases/base_movie_usecase.dart';
import 'package:movie_hub/core/error/failure.dart';
import 'package:movie_hub/features/Movies/domain/entities/movie.dart';
import 'package:movie_hub/features/Movies/domain/repositories/base_movie_repo.dart';

class GetPopularMoviesUsecase implements BaseMovieUsecase<List<Movie>> {
  final BaseMoviesRepo baseMoviesRepo;

  GetPopularMoviesUsecase({required this.baseMoviesRepo});
  
  @override
  Future<Either<Failure, List<Movie>>> call() async {
    final response = await baseMoviesRepo.getPopularMovies();
    return response;
  }
}
