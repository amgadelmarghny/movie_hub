import 'package:flutter/material.dart';
import 'package:movie_hub/features/Movies/presentation/widgets/now_playing_movies_section.dart';
import 'package:movie_hub/features/Movies/presentation/widgets/popular_movies_section.dart';
import 'package:movie_hub/features/Movies/presentation/widgets/top_rated_movies_section.dart';

class MoviesView extends StatelessWidget {
  const MoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        key: const Key('movieScrollView'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const NowPlayingMoviesSection(),
            const PopularMoviesSection(),
            const TopRatedMoviesSection(),
          ],
        ),
      ),
    );
  }
}
