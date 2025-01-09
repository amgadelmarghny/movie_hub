import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:movie_hub/features/Movies/domain/entities/movie.dart';
import 'package:movie_hub/features/Movies/presentation/widgets/movie_item.dart';

class AnimationMovieItemsListViewBuilder extends StatelessWidget {
  const AnimationMovieItemsListViewBuilder({
    super.key,
    required this.moviesList,
  });
  final List<Movie> moviesList;
  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 500),
      child: SizedBox(
        height: 170.0,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          itemCount: moviesList.length,
          itemBuilder: (context, index) {
            return MovieItem(
              movieModel: moviesList[index],
            );
          },
        ),
      ),
    );
  }
}
