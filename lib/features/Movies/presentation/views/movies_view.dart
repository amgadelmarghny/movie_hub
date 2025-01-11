import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_hub/core/services/service_locator.dart';
import 'package:movie_hub/features/Movies/presentation/bloc/movie/movie_bloc.dart';
import 'package:movie_hub/features/Movies/presentation/widgets/movie_view_body.dart';

class MoviesView extends StatelessWidget {
  const MoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => MovieBloc(
        getNowPlayingMovieUsecase: sl(),
        getPopularMoviesUsecase: sl(),
        getTopRatedMoviesUsecase: sl(),
      )
        ..add(GetNowPlayingMoviesEvent())
        ..add(GetPopularMoviesEvent())
        ..add(GetTopRatedMoviesEvent())
        ,
      child: const Scaffold(
        body: MovieViewBody(),
      ),
    );
  }
}
