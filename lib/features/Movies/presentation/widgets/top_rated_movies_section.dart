import 'package:flutter/material.dart';
import 'package:movie_hub/features/Movies/presentation/widgets/section_header.dart';
import 'package:movie_hub/features/Movies/presentation/widgets/top_rated_movies_section_body.dart';

class TopRatedMoviesSection extends StatelessWidget {
  const TopRatedMoviesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(
          onTap: () {
            /// TODO : NAVIGATION TO POPULAR SCREEN
          },
          sectionName: 'Top Rated',
        ),
        const TopRatedMoviesSectionBody(),
      ],
    );
  }
}
