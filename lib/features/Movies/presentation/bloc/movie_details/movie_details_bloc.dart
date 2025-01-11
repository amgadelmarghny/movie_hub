import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_hub/core/error/failure.dart';
import 'package:movie_hub/features/Movies/domain/entities/movie_details.dart';
import 'package:movie_hub/features/Movies/domain/usecases/get_movie_details_usecase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUsecase getMovieDetailsUsecase;
  late MovieDetails movieDetails;
  MovieDetailsBloc(this.getMovieDetailsUsecase) : super(MovieDetailsInitial()) {
    
    on<GetMovieDetailsEvent>((event, emit) async {
      Either<Failure, MovieDetails> result =
          await getMovieDetailsUsecase(event.movieId);
      result.fold((l) => emit(GetMovieDetailsFailure(errorMessage: l.message)),
          (r) {
        movieDetails = r;
        emit(GetMovieDetailsSuccess());
      });
    });
  }
}
