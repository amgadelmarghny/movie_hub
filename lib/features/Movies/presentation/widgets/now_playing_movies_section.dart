import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_hub/features/Movies/presentation/bloc/movie_bloc.dart';
import 'package:movie_hub/features/Movies/presentation/widgets/now_playing_section_success_widget.dart';

class NowPlayingMoviesSection extends StatelessWidget {
  const NowPlayingMoviesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        // loading
        if (state is GetNowPlayingStateLoading) {
          return SizedBox(
            height: 400,
            child: const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          );
        }
        // get data success
        if (state is GetNowPlayingStateSuccess) {
          return NowPlayingMoviesSuccessWidget(
            moviesList: state.movies,
          );
        } 
        // error
        else {
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
      },
    );
  }
}
