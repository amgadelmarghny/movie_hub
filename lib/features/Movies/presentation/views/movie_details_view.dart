import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_hub/core/services/service_locator.dart';
import 'package:movie_hub/features/Movies/presentation/bloc/movie_details/movie_details_bloc.dart';
import 'package:movie_hub/features/Movies/presentation/widgets/movie_details_view_body.dart';

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({super.key});

  static const pageRoute = 'MovieDetailsView';

  @override
  Widget build(BuildContext context) {
    final int id = ModalRoute.settingsOf(context)!.arguments! as int;
    return BlocProvider(
      create: (context) => MovieDetailsBloc(
        getMovieDetailsUsecase: sl(),
        getMovieRecomendationsUsecase: sl(),
      )
        ..add(GetMovieDetailsEvent(movieId: id))
        ..add(GetMovieRecommendationsEvent(movieId: id)),
      child: Scaffold(
        body: MovieDetailsViewBody(),
      ),
    );
  }
}
