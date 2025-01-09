import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_hub/features/Movies/domain/entities/movie.dart';
import 'package:movie_hub/features/Movies/presentation/bloc/movie_bloc.dart';
import 'package:movie_hub/features/Movies/presentation/widgets/animation_movie_item_list_view_builder.dart';

class PopularMoviesSectionBody extends StatefulWidget {
  const PopularMoviesSectionBody({
    super.key,
  });

  @override
  State<PopularMoviesSectionBody> createState() =>
      _PopularMoviesSectionBodyState();
}

class _PopularMoviesSectionBodyState extends State<PopularMoviesSectionBody> {
  @override
  Widget build(BuildContext context) {
    List<Movie> moviesList = BlocProvider.of<MovieBloc>(context).popularMovies;
    return BlocConsumer<MovieBloc, MovieState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
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
          condition: moviesList.isNotEmpty,
          builder: (context) {
            return AnimationMovieItemsListViewBuilder(
              moviesList: moviesList,
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
      listener: (BuildContext context, MovieState state) {
        if (state is GetPopularMoviesStateSuccess) {
          setState(() {});
        }
      },
    );
  }
}
