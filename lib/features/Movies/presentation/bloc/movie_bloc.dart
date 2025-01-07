import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_hub/core/services/service_locator.dart';
import 'package:movie_hub/features/Movies/domain/entities/movie.dart';
import 'package:movie_hub/features/Movies/domain/usecases/get_now_playing_movie_usecase.dart';
part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieInitial()) {
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
  }
}
