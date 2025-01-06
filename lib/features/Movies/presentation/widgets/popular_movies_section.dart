import 'package:flutter/material.dart';
import 'package:movie_hub/features/Movies/presentation/widgets/popular_movies_section_body.dart';
import 'package:movie_hub/features/Movies/presentation/widgets/section_header.dart';

class PopularMoviesSection extends StatelessWidget {
  const PopularMoviesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(
          sectionName: 'Popular',
          onTap: () {
            /// TODO : NAVIGATION TO POPULAR SCREEN
          },
        ),
        const PopularMoviesSectionBody(),
      ],
    );
  }
}
