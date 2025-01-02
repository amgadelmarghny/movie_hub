import 'package:movie_hub/core/utils/api_keys.dart';

abstract class AppConstance {
  static const baseUrl = 'https://api.themoviedb.org/3/';
  static const token = ApiKeys.authorizationToken;
  static const apiKey = ApiKeys.apiKey;
}
