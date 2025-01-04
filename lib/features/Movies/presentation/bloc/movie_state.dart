part of 'movie_bloc.dart';

sealed class MovieState extends Equatable {
  final List<Movie> movies;
  final ResquestState nowPlayingMovieState;
  final String errorMessage;

  const MovieState(
      {this.movies = const [],
      this.nowPlayingMovieState = ResquestState.loading,
      this.errorMessage = ''});
  @override
  List<Object> get props => [movies, nowPlayingMovieState, errorMessage];
}

final class MovieInitial extends MovieState {}


