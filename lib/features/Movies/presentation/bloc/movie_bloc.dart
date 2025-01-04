import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_hub/core/utils/enums.dart';
import 'package:movie_hub/features/Movies/data/datasources/remote/movie_remote_data_source.dart';
import 'package:movie_hub/features/Movies/data/repositories/movie_repo.dart';
import 'package:movie_hub/features/Movies/domain/entities/movie.dart';
import 'package:movie_hub/features/Movies/domain/repositories/base_movie_repo.dart';
import 'package:movie_hub/features/Movies/domain/usecases/get_now_playing_movie_usecase.dart';
part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieInitial()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      BaseMovieDataSource baseMovieDataSource = MovieDataSource();
      BaseMoviesRepo baseMoviesRepo =
          MovieRepo(baseMovieDataSource: baseMovieDataSource);
      final dataResult =
          await GetNowPlayingMovieUsecase(baseMoviesRepo: baseMoviesRepo)
              .execute();
      if (dataResult.isRight()) {}
    });
  }
}
