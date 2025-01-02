import 'package:flutter/material.dart';
import 'package:movie_hub/core/network/dio_helper.dart';

void main() {
  DioHelper.init();
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
        useMaterial3: true,
      ),
    );
  }
}
