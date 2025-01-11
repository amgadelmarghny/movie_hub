import 'package:dartz/dartz.dart';
import 'package:movie_hub/core/base_usecases/base_movie_usecase.dart';
import 'package:movie_hub/core/error/failure.dart';
import 'package:movie_hub/features/Movies/domain/entities/movie_details.dart';
import 'package:movie_hub/features/Movies/domain/repositories/base_movie_repo.dart';

class GetMovieDetailsUsecase implements BaseMovieUsecase<MovieDetails, int> {
  final BaseMoviesRepo baseMoviesRepo;

  GetMovieDetailsUsecase({required this.baseMoviesRepo});

  @override
  Future<Either<Failure, MovieDetails>> call(int movieId) async {
    return await baseMoviesRepo.getMovieDetails(movieId: movieId);
  }
}
