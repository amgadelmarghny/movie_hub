import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_hub/features/Movies/domain/entities/movie.dart';
import 'package:movie_hub/features/Movies/presentation/bloc/movie_bloc.dart';
import 'package:movie_hub/features/Movies/presentation/widgets/animation_movie_item_list_view_builder.dart';

class TopRatedMoviesSectionBody extends StatefulWidget {
  const TopRatedMoviesSectionBody({
    super.key,
  });

  @override
  State<TopRatedMoviesSectionBody> createState() =>
      _TopRatedMoviesSectionBodyState();
}

class _TopRatedMoviesSectionBodyState extends State<TopRatedMoviesSectionBody> {
  @override
  Widget build(BuildContext context) {
    List<Movie> moviesList = BlocProvider.of<MovieBloc>(context).topRatedMovies;

    return BlocConsumer<MovieBloc, MovieState>(
      builder: (context, state) {
        if (state is GetTopRatedMoviesStateFailure) {
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
      listener: (BuildContext context, state) {
        if (state is GetTopRatedMoviesStateSuccess) {
          setState(() {});
        }
      },
    );
  }
}
