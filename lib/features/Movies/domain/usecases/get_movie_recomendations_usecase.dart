import 'package:dartz/dartz.dart';
import 'package:movie_hub/core/base_usecases/base_movie_usecase.dart';
import 'package:movie_hub/core/error/failure.dart';
import 'package:movie_hub/features/Movies/domain/entities/movie_recommendation.dart';
import 'package:movie_hub/features/Movies/domain/repositories/base_movie_repo.dart';

class GetMovieRecomendationsUsecase
    implements BaseMovieUsecase<List<MovieRecommendation>, int> {

  final BaseMoviesRepo baseMoviesRepo;

  GetMovieRecomendationsUsecase({required this.baseMoviesRepo});

  @override
  Future<Either<Failure, List<MovieRecommendation>>> call(int movieId) async {
    return await baseMoviesRepo.getMovieRecommendations(movieId: movieId);
  }
}
