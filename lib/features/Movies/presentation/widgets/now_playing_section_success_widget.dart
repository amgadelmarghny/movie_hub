import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_hub/features/Movies/domain/entities/movie.dart';
import 'package:movie_hub/features/Movies/presentation/widgets/now_playing_movie_item.dart';

class NowPlayingMoviesSuccessWidget extends StatelessWidget {
  const NowPlayingMoviesSuccessWidget({
    super.key,
    required this.moviesList,
  });
  final List<Movie> moviesList;
  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 500),
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          height: 400.0,
          viewportFraction: 1.0,
          onPageChanged: (index, reason) {},
        ),
        items: moviesList.map(
          (item) {
            return NowPlayingMovieItem(
              movieModel: item,
            );
          },
        ).toList(),
      ),
    );
  }
}
