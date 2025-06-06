import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_hub/core/utils/api_constance.dart';
import 'package:movie_hub/features/Movies/domain/entities/movie.dart';
import 'package:movie_hub/features/Movies/presentation/views/movie_details_view.dart';
import 'package:movie_hub/features/Movies/presentation/widgets/movie_loading_item.dart';
import 'package:shimmer/shimmer.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({
    super.key,
    required this.movieModel,
  });
  final Movie movieModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 8.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, MovieDetailsView.pageRoute,
              arguments: movieModel.id);
        },
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          child: CachedNetworkImage(
            width: 120.0,
            fit: BoxFit.cover,
            imageUrl: movieModel.backdropPath != null
                ? ApiConstance.imageUrl(movieModel.backdropPath!)
                : 'https://static.vecteezy.com/system/resources/thumbnails/004/141/669/small/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg',
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey[850]!,
              highlightColor: Colors.grey[800]!,
              child: MovieLoadingItem(),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
