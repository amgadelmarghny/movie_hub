import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_hub/core/network/dio_helper.dart';
import 'package:movie_hub/core/services/service_locator.dart';
import 'package:movie_hub/core/utils/bloc_observer.dart';
import 'package:movie_hub/features/Movies/presentation/views/movie_details_view.dart';
import 'package:movie_hub/features/Movies/presentation/views/movies_view.dart';

void main() {
  DioHelper.init();
  ServiceLocator.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MovieHub());
}

class MovieHub extends StatelessWidget {
  const MovieHub({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        MoviesView.pageRoute: (context) => const MoviesView(),
        MovieDetailsView.pageRoute: (context) => const MovieDetailsView(),
      },
      themeMode: ThemeMode.dark,
      title: 'Movie Hub',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[900],
        useMaterial3: true,
      ),
      initialRoute: MoviesView.pageRoute,
    );
  }
}
