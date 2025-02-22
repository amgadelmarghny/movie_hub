import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_hub/core/base_usecases/base_movie_usecase.dart';
import 'package:movie_hub/features/Movies/domain/entities/movie.dart';
import 'package:movie_hub/features/Movies/domain/usecases/get_now_playing_movie_usecase.dart';
import 'package:movie_hub/features/Movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movie_hub/features/Movies/domain/usecases/get_top_rated__movies_usecase.dart';
part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetNowPlayingMovieUsecase getNowPlayingMovieUsecase;
  final GetPopularMoviesUsecase getPopularMoviesUsecase;
  final GetTopRatedMoviesUsecase getTopRatedMoviesUsecase;

  List<Movie> nowPlayingMovies = [];
  List<Movie> popularMovies = [];
  List<Movie> topRatedMovies = [];
  static MovieBloc get(context) => BlocProvider.of(context);
  MovieBloc(
      {required this.getNowPlayingMovieUsecase,
      required this.getPopularMoviesUsecase,
      required this.getTopRatedMoviesUsecase})
      : super(MovieInitial()) {
    // now playing movies logic
    on<GetNowPlayingMoviesEvent>(
      (event, emit) async {
        emit(GetNowPlayingStateLoading());
        final dataResult = await getNowPlayingMovieUsecase(NoParameters());
        dataResult.fold(
          (error) => emit(
            GetNowPlayingStateFailure(errorMessage: error.message),
          ),
          (movies) {
            nowPlayingMovies = movies;
            emit(
              GetNowPlayingStateSuccess(),
            );
          },
        );
      },
    );
    // popular movies logic
    on<GetPopularMoviesEvent>(
      (event, emit) async {
        emit(GetPopularMoviesStateLoading());
        final dataResult = await getPopularMoviesUsecase(NoParameters());
        dataResult.fold(
            (error) => emit(
                  GetPopularMoviesStateFailure(errorMessage: error.message),
                ), (movies) {
          popularMovies = movies;
          emit(
            GetPopularMoviesStateSuccess(),
          );
        });
      },
    );
    // top rated movies logic
    on<GetTopRatedMoviesEvent>(
      (event, emit) async {
        emit(GetTopRatedMoviesStateLoading());
        final dataResult = await getTopRatedMoviesUsecase(NoParameters());
        dataResult.fold((error) {
          log('error : $error');
          emit(
            GetTopRatedMoviesStateFailure(errorMessage: error.message),
          );
        }, (movies) {
          topRatedMovies = movies;
          emit(
            GetTopRatedMoviesStateSuccess(),
          );
        });
      },
    );
  }
}
