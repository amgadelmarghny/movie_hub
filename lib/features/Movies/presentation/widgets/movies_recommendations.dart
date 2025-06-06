import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_hub/core/utils/api_constance.dart';
import 'package:movie_hub/features/Movies/domain/entities/movie_recommendation.dart';
import 'package:movie_hub/features/Movies/presentation/views/movie_details_view.dart';
import 'package:shimmer/shimmer.dart';

class MoviesRecommendationsSection extends StatelessWidget {
  const MoviesRecommendationsSection(
      {super.key, required this.moviesRecommendationList});
  final List<MovieRecommendation> moviesRecommendationList;
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return FadeInUp(
            duration: const Duration(milliseconds: 500),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, MovieDetailsView.pageRoute,
                    arguments: moviesRecommendationList[index].id);
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                child: CachedNetworkImage(
                  imageUrl: moviesRecommendationList[index].backdropPath != null
                      ? ApiConstance.imageUrl(
                          moviesRecommendationList[index].backdropPath!)
                      : 'https://static.vecteezy.com/system/resources/thumbnails/004/141/669/small/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg',
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey[850]!,
                    highlightColor: Colors.grey[800]!,
                    child: Container(
                      height: 170.0,
                      width: 120.0,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  height: 180.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
        childCount: moviesRecommendationList.length,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        childAspectRatio: 0.7,
        crossAxisCount: 3,
      ),
    );
  }
}
