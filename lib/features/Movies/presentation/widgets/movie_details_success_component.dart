import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:movie_hub/features/Movies/domain/entities/movie_details.dart';
import 'package:movie_hub/features/Movies/domain/entities/movie_recommendation.dart';
import 'package:movie_hub/features/Movies/presentation/widgets/movie_details_details.dart';
import 'package:movie_hub/features/Movies/presentation/widgets/movie_details_image.dart';
import 'package:movie_hub/features/Movies/presentation/widgets/movies_recommendations.dart';

class MovieDetailsSuccessComponent extends StatelessWidget {
  const MovieDetailsSuccessComponent(
      {super.key,
      required this.movieDetails,
      required this.movieRecommendationList});
  final MovieDetails movieDetails;
  final List<MovieRecommendation> movieRecommendationList;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      key: const Key('movieDetailScrollView'),
      slivers: [
        if (movieDetails.backdropPath != null)
          MovieDetailsImage(
            movieImage: movieDetails.backdropPath!,
          ),
        if (movieDetails.backdropPath == null)
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
        MovieDetailsDetails(
          movieDetails: movieDetails,
          genres: movieDetails.genres,
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
          sliver: SliverToBoxAdapter(
            child: FadeInUp(
              duration: const Duration(milliseconds: 500),
              child: const Text(
                'More Like This',
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.2,
                    color: Colors.white),
              ),
            ),
          ),
        ),
        // Tab(text: 'More like this'.toUpperCase()),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 24.0),
          sliver: MoviesRecommendationsSection(
            moviesRecommendationList: movieRecommendationList,
          ),
        ),
      ],
    );
  }
}
