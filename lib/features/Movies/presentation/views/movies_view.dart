import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_hub/features/Movies/presentation/bloc/movie_bloc.dart';
import 'package:movie_hub/features/Movies/presentation/widgets/movie_view_body.dart';

class MoviesView extends StatelessWidget {
  const MoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => MovieBloc()
        ..add(
          GetNowPlayingMoviesEvent(),
        ),
      child: const Scaffold(
        body: MovieViewBody(),
      ),
    );
  }
}
