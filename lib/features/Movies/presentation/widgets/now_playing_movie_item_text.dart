import 'package:flutter/material.dart';

class NowPlayingMovieItemText extends StatelessWidget {
  const NowPlayingMovieItemText({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // NOW PLAYING title
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.circle,
                  color: Colors.redAccent,
                  size: 16.0,
                ),
                const SizedBox(width: 4.0),
                Text(
                  'NOW PLAYING',
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          // movie name
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
