part of 'movie_details_bloc.dart';

sealed class MovieDetailsState extends Equatable {
  const MovieDetailsState();

  @override
  List<Object> get props => [];
}

final class MovieDetailsInitial extends MovieDetailsState {}

final class GetMovieDetailLoading extends MovieDetailsState {}

final class GetMovieDetailsSuccess extends MovieDetailsState {}

final class GetMovieDetailsFailure extends MovieDetailsState {
  final String errorMessage;

  const GetMovieDetailsFailure({required this.errorMessage});
}

final class GetMovieRecommendationsLoading extends MovieDetailsState {}

final class GetMovieRecommendationsSuccess extends MovieDetailsState {}

final class GetMovieRecommendationsFailure extends MovieDetailsState {
  final String errorMessage;

  const GetMovieRecommendationsFailure({required this.errorMessage});
}
