import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_hub/features/Movies/presentation/bloc/movie/movie_bloc.dart';
import 'package:movie_hub/features/Movies/presentation/widgets/now_playing_section_success_widget.dart';

class NowPlayingMoviesSection extends StatelessWidget {
  const NowPlayingMoviesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        var bloc = MovieBloc.get(context);

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
          condition: bloc.nowPlayingMovies.isNotEmpty,
          builder: (context) {
            return NowPlayingMoviesSuccessWidget(
              moviesList: bloc.nowPlayingMovies,
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
    );
  }
}
