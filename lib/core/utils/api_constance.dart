import 'package:movie_hub/core/utils/api_keys.dart';

abstract class ApiConstance {
  static const baseUrl = 'https://api.themoviedb.org/3/';
  static const token = ApiKeys.authorizationToken;
  static const apiKey = ApiKeys.apiKey;
  static const String _baseImageUrl = 'https://image.tmdb.org/t/p/w500';
  static String imageUrl(String path) => '$_baseImageUrl/$path';
}
