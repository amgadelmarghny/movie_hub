import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_hub/features/Movies/presentation/bloc/movie_details/movie_details_bloc.dart';
import 'package:movie_hub/features/Movies/presentation/widgets/movie_details_success_component.dart';

class MovieDetailsViewBody extends StatelessWidget {
  const MovieDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      builder: (context, state) {
        var bloc = MovieDetailsBloc.get(context);
        if (state is GetMovieDetailsFailure) {
          Center(
            child: Text(
              state.errorMessage,
              style: TextStyle(fontSize: 24),
            ),
          );
        }
        return ConditionalBuilder(
          condition: bloc.movieDetails != null,
          builder: (context) => MovieDetailsSuccessComponent(
            movieDetails: bloc.movieDetails!,
            movieRecommendationList: bloc.recomendationsList,
          ),
          fallback: (context) => Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
