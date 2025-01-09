import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_hub/features/Movies/domain/entities/movie.dart';
import 'package:movie_hub/features/Movies/presentation/bloc/movie_bloc.dart';
import 'package:movie_hub/features/Movies/presentation/widgets/now_playing_section_success_widget.dart';

class NowPlayingMoviesSection extends StatefulWidget {
  const NowPlayingMoviesSection({super.key});

  @override
  State<NowPlayingMoviesSection> createState() =>
      _NowPlayingMoviesSectionState();
}

class _NowPlayingMoviesSectionState extends State<NowPlayingMoviesSection> {
  @override
  Widget build(BuildContext context) {
    List<Movie> moviesList =
        BlocProvider.of<MovieBloc>(context).nowPlayingMovies;
    return BlocConsumer<MovieBloc, MovieState>(
      builder: (context, state) {
        // loading
        if (state is GetNowPlayingStateFailure) {
          return SizedBox(
            height: 400.0,
            child: Center(
              child: Icon(
                Icons.error_outline_sharp,
                color: Colors.white,
              ),
            ),
          );
        }
        return ConditionalBuilder(
          condition: moviesList.isNotEmpty,
          builder: (context) {
            return NowPlayingMoviesSuccessWidget(
              moviesList: moviesList,
            );
          },
          fallback: (context) => SizedBox(
            height: 400,
            child: const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          ),
        );
      },
      listener: (BuildContext context, MovieState state) {
        if (state is GetNowPlayingStateSuccess) {
          setState(() {});
        }
      },
    );
  }
}
