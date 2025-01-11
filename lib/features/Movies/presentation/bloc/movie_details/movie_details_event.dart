part of 'movie_details_bloc.dart';

sealed class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();

  @override
  List<Object> get props => [];
}

final class GetMovieDetailsEvent extends MovieDetailsEvent {
  final int movieId;

  const GetMovieDetailsEvent({required this.movieId});

  @override
  List<Object> get props => [movieId];
}

final class GetMovieRecommendationsEvent extends MovieDetailsEvent {
  final int movieId;

  const GetMovieRecommendationsEvent({required this.movieId});

  @override
  List<Object> get props => [movieId];
}
