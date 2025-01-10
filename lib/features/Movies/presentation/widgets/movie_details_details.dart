import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_hub/features/Movies/domain/entities/genres.dart';
import 'package:movie_hub/features/Movies/domain/entities/movie_details.dart';
import 'package:movie_hub/features/Movies/presentation/widgets/movie_release_date_and_vote_avarage_and_run_time_details.dart';

class MovieDetailsDetails extends StatelessWidget {
  const MovieDetailsDetails({
    super.key,
    required this.genres,
    required this.movieDetails,
  });
  final MovieDetails movieDetails;
  final List<Genres> genres;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: FadeInUp(
        from: 20,
        duration: const Duration(milliseconds: 500),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(movieDetails.title,
                  style: GoogleFonts.poppins(
                    fontSize: 23,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                  )),
              const SizedBox(height: 8.0),
              MovieReleaseDateAndVoteAvarageAndRunTimeDetails(
                releaseDate: movieDetails.releaseDate,
                voteAverage: movieDetails.voteAverage,
                runtime: movieDetails.runtime,
              ),
              const SizedBox(height: 20.0),
              Text(
                movieDetails.overview,
                style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                'Genres: ${_showGenres(genres)}',
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _showGenres(List<Genres> genres) {
    String result = '';
    for (var genre in genres) {
      result += '${genre.name}, ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }
}
