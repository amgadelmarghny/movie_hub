import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_hub/features/Movies/domain/entities/movie.dart';
import 'package:movie_hub/features/Movies/presentation/bloc/movie_bloc.dart';
import 'package:movie_hub/features/Movies/presentation/widgets/animation_movie_item_list_view_builder.dart';

class PopularMoviesSectionBody extends StatelessWidget {
  const PopularMoviesSectionBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        var bloc = MovieBloc.get(context);
        
        if (state is GetPopularMoviesStateFailure) {
          return SizedBox(
            height: 170.0,
            child: Icon(
              Icons.error_outline_rounded,
              color: Colors.white,
              size: 40,
            ),
          );
        }
        return ConditionalBuilder(
          condition: bloc.popularMovies.isNotEmpty,
          builder: (context) {
            return AnimationMovieItemsListViewBuilder(
              moviesList: bloc.popularMovies,
            );
          },
          fallback: (context) => SizedBox(
            height: 170.0,
            child: const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }
}
