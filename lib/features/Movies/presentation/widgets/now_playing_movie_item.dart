import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_hub/core/utils/api_constance.dart';
import 'package:movie_hub/features/Movies/domain/entities/movie.dart';
import 'package:movie_hub/features/Movies/presentation/widgets/now_playing_movie_item_text.dart';

class NowPlayingMovieItem extends StatelessWidget {
  const NowPlayingMovieItem({
    super.key,
    required this.movieModel,
  });
  
  final Movie movieModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: const Key('openMovieMinimalDetail'),
      onTap: () {
        // TODO
      },
      child: Stack(
        children: [
          ShaderMask(
            shaderCallback: (rect) {
              return const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  // fromLTRB
                  Colors.transparent,
                  Colors.black,
                  Colors.black,
                  Colors.transparent,
                ],
                stops: [0, 0.3, 0.5, 1],
              ).createShader(
                Rect.fromLTRB(0, 0, rect.width, rect.height),
              );
            },
            blendMode: BlendMode.dstIn,
            child: CachedNetworkImage(
              height: 560.0,
              imageUrl: ApiConstance.imageUrl(movieModel.backdropPath),
              fit: BoxFit.cover,
            ),
          ),
          NowPlayingMovieItemText(title: movieModel.title),
        ],
      ),
    );
  }
}
