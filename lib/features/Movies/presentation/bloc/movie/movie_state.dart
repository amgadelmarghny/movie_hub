part of 'movie_bloc.dart';

sealed class MovieState extends Equatable {
  @override
  List<Object> get props => [];
}

final class MovieInitial extends MovieState {}

final class GetNowPlayingStateLoading extends MovieState {}

final class GetNowPlayingStateSuccess extends MovieState {}

final class GetNowPlayingStateFailure extends MovieState {
  final String errorMessage;

  GetNowPlayingStateFailure({required this.errorMessage});
}

final class GetPopularMoviesStateLoading extends MovieState {}

final class GetPopularMoviesStateSuccess extends MovieState {}

final class GetPopularMoviesStateFailure extends MovieState {
  final String errorMessage;

  GetPopularMoviesStateFailure({required this.errorMessage});
}

final class GetTopRatedMoviesStateLoading extends MovieState {}

final class GetTopRatedMoviesStateSuccess extends MovieState {}

final class GetTopRatedMoviesStateFailure extends MovieState {
  final String errorMessage;

  GetTopRatedMoviesStateFailure({required this.errorMessage});
}
