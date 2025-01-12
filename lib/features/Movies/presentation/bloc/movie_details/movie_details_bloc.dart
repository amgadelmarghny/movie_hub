import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_hub/core/error/failure.dart';
import 'package:movie_hub/features/Movies/domain/entities/movie_details.dart';
import 'package:movie_hub/features/Movies/domain/entities/movie_recommendation.dart';
import 'package:movie_hub/features/Movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movie_hub/features/Movies/domain/usecases/get_movie_recomendations_usecase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUsecase getMovieDetailsUsecase;
  final GetMovieRecomendationsUsecase getMovieRecomendationsUsecase;
  MovieDetails? movieDetails;
  List<MovieRecommendation> recomendationsList= [];
  static MovieDetailsBloc get(context) => BlocProvider.of(context);
  MovieDetailsBloc(
      {required this.getMovieDetailsUsecase,
      required this.getMovieRecomendationsUsecase})
      : super(MovieDetailsInitial()) {
    // Get Movie Details
    on<GetMovieDetailsEvent>((event, emit) async {
      final Either<Failure, MovieDetails> result =
          await getMovieDetailsUsecase(event.movieId);
      result.fold((l) => emit(GetMovieDetailsFailure(errorMessage: l.message)),
          (r) {
        movieDetails = r;
        emit(GetMovieDetailsSuccess());
      });
    });

    // Get Movie Recommendations
    on<GetMovieRecommendationsEvent>((event, emit) async {
      emit(GetMovieRecommendationsLoading());
      final result = await getMovieRecomendationsUsecase(event.movieId);
      result.fold(
        (l) => emit(GetMovieRecommendationsFailure(errorMessage: l.message)),
        (r) {
          recomendationsList = r;
          emit(GetMovieRecommendationsSuccess());
        },
      );
    });
  }
}
