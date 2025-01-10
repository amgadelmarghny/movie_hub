import 'package:flutter/material.dart';

class MovieReleaseDateAndVoteAvarageAndRunTimeDetails extends StatelessWidget {
  const MovieReleaseDateAndVoteAvarageAndRunTimeDetails({
    super.key,
    required this.releaseDate,
    required this.voteAverage,
    required this.runtime,
  });

  final String releaseDate ;
  final int runtime;
  final double voteAverage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 2.0,
            horizontal: 8.0,
          ),
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Text(
            releaseDate,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(width: 16.0),
        Row(
          children: [
            const Icon(
              Icons.star,
              color: Colors.amber,
              size: 20.0,
            ),
            const SizedBox(width: 4.0),
            Text(
              (voteAverage /2).toStringAsFixed(1),
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(width: 4.0),
            Text(
              voteAverage.toString(),
              style: const TextStyle(
                fontSize: 1.0,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
        const SizedBox(width: 16.0),
        Text(
          _showDuration(runtime),
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }

  String _showDuration(int runtime) {
    final int hours = runtime ~/ 60;
    final int minutes = runtime % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }
}
