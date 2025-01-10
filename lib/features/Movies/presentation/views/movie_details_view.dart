import 'package:flutter/material.dart';
import 'package:movie_hub/features/Movies/presentation/widgets/movie_details_view_body.dart';

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MovieDetailsViewBody(),
    );
  }
}
