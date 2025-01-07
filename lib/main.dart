import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_hub/core/network/dio_helper.dart';
import 'package:movie_hub/core/services/service_locator.dart';
import 'package:movie_hub/core/utils/bloc_observer.dart';
import 'package:movie_hub/features/Movies/presentation/views/movies_view.dart';

void main() async {
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
      title: 'Movie Hub',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        useMaterial3: true,
      ),
      home: MoviesView(),
    );
  }
}
