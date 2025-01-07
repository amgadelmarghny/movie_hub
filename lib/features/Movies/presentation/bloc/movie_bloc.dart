import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_hub/core/services/service_locator.dart';
import 'package:movie_hub/features/Movies/domain/entities/movie.dart';
import 'package:movie_hub/features/Movies/domain/usecases/get_now_playing_movie_usecase.dart';
import 'package:movie_hub/features/Movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movie_hub/features/Movies/domain/usecases/get_top_rated__movies_usecase.dart';
part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieInitial()) {
    // now playing movies logic
    on<GetNowPlayingMoviesEvent>(
      (event, emit) async {
        emit(GetNowPlayingStateLoading());
        final dataResult =
            await GetNowPlayingMovieUsecase(baseMoviesRepo: sl()).execute();
        dataResult.fold(
          (error) => emit(
            GetNowPlayingStateFailure(errorMessage: error.message),
          ),
          (movies) => emit(
            GetNowPlayingStateSuccess(movies: movies),
          ),
        );
      },
    );
    // popular movies logic
    on<GetPopularMoviesEvent>(
      (event, emit) async {
        emit(GetPopularMoviesStateLoading());
        final dataResult =
            await GetPopularMoviesUsecase(baseMoviesRepo: sl()).execute();
        dataResult.fold(
          (error) => emit(
            GetPopularMoviesStateFailure(errorMessage: error.message),
          ),
          (movies) => emit(
            GetPopularMoviesStateSuccess(movies: movies),
          ),
        );
      },
    );
    // top rated movies logic
    on<GetTopRatedMoviesEvent>(
      (event, emit) async {
        emit(GetTopRatedMoviesStateLoading());
        final dataResult =
            await GetTopRatedMoviesUsecase(baseMoviesRepo: sl()).execute();
        dataResult.fold(
          (error) => emit(
            GetTopRatedMoviesStateFailure(errorMessage: error.message),
          ),
          (movies) => emit(
            GetTopRatedMoviesStateSuccess(movies: movies),
          ),
        );
      },
    );
  }
}
