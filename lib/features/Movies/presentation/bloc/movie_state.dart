part of 'movie_bloc.dart';

sealed class MovieState extends Equatable {
  @override
  List<Object> get props => [];
}

final class MovieInitial extends MovieState {}

final class GetNowPlayingStateLoading extends MovieState {}

final class GetNowPlayingStateSuccess extends MovieState {
  final List<Movie> movies;

  GetNowPlayingStateSuccess({required this.movies});
}

final class GetNowPlayingStateFailure extends MovieState {
  final String errorMessage;

  GetNowPlayingStateFailure({required this.errorMessage});
}
