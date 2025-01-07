import 'package:flutter/material.dart';
import 'package:movie_hub/features/Movies/presentation/widgets/now_playing_movies_section.dart';
import 'package:movie_hub/features/Movies/presentation/widgets/popular_movies_section.dart';
import 'package:movie_hub/features/Movies/presentation/widgets/top_rated_movies_section.dart';

class MovieViewBody extends StatelessWidget {
  const MovieViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      key: Key('movieScrollView'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NowPlayingMoviesSection(),
          PopularMoviesSection(),
          TopRatedMoviesSection(),
        ],
      ),
    );
  }
}
