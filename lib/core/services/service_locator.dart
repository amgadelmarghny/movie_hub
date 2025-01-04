import 'package:get_it/get_it.dart';
import 'package:movie_hub/features/Movies/data/datasources/remote/movie_remote_data_source.dart';
import 'package:movie_hub/features/Movies/data/repositories/movie_repo.dart';
import 'package:movie_hub/features/Movies/domain/repositories/base_movie_repo.dart';
import 'package:movie_hub/features/Movies/domain/usecases/get_now_playing_movie_usecase.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    // data source
    sl.registerLazySingleton<BaseMovieDataSource>(() => MovieDataSource());
    // Repo
    sl.registerLazySingleton<BaseMoviesRepo>(
        () => MovieRepo(baseMovieDataSource: sl()));
    // useCase
    sl.registerLazySingleton<GetNowPlayingMovieUsecase>(
        () => GetNowPlayingMovieUsecase(baseMoviesRepo: sl()));
  }
}
