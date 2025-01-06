import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_hub/core/utils/api_constance.dart';
import 'package:movie_hub/features/Movies/domain/entities/movie.dart';
import 'package:movie_hub/features/Movies/presentation/widgets/movie_loading_item.dart';
import 'package:shimmer/shimmer.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({
    super.key, required this.movieModel,
  });
  final Movie movieModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 8.0),
      child: InkWell(
        onTap: () {
          /// TODO : NAVIGATE TO  MOVIE DETAILS
        },
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          child: CachedNetworkImage(
            width: 120.0,
            fit: BoxFit.cover,
            imageUrl: ApiConstance.imageUrl(movieModel.backdropPath),
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