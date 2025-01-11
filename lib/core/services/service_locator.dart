import 'package:get_it/get_it.dart';
import 'package:movie_hub/features/Movies/data/datasources/remote/movie_remote_data_source.dart';
import 'package:movie_hub/features/Movies/data/repositories/movie_repo.dart';
import 'package:movie_hub/features/Movies/domain/repositories/base_movie_repo.dart';
import 'package:movie_hub/features/Movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movie_hub/features/Movies/domain/usecases/get_now_playing_movie_usecase.dart';
import 'package:movie_hub/features/Movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movie_hub/features/Movies/domain/usecases/get_top_rated__movies_usecase.dart';

final sl = GetIt.instance;

abstract class ServiceLocator {
  static void init() {
    // data source
    sl.registerLazySingleton<BaseMovieDataSource>(() => MovieDataSource());
    // Repo
    sl.registerLazySingleton<BaseMoviesRepo>(
        () => MovieRepo(baseMovieDataSource: sl()));
    // now playing movies use case
    sl.registerLazySingleton<GetNowPlayingMovieUsecase>(
        () => GetNowPlayingMovieUsecase(baseMoviesRepo: sl()));
    // popular movies use case
    sl.registerLazySingleton<GetPopularMoviesUsecase>(
        () => GetPopularMoviesUsecase(baseMoviesRepo: sl()));
    // top rated movies use case
    sl.registerLazySingleton<GetTopRatedMoviesUsecase>(
        () => GetTopRatedMoviesUsecase(baseMoviesRepo: sl()));
    // movie details
    sl.registerLazySingleton<GetMovieDetailsUsecase>(
        () => GetMovieDetailsUsecase(baseMoviesRepo: sl()));
  }
}
