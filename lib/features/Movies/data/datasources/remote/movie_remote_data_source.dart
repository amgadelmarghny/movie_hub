import 'package:dio/dio.dart';
import 'package:movie_hub/core/error/error_model.dart';
import 'package:movie_hub/core/network/dio_helper.dart';
import 'package:movie_hub/core/network/server_exception.dart';
import 'package:movie_hub/core/utils/api_constance.dart';
import 'package:movie_hub/features/Movies/data/models/movie_details_model.dart';
import 'package:movie_hub/features/Movies/data/models/movie_model.dart';
import 'package:movie_hub/features/Movies/data/models/movie_recommendation_model.dart';

abstract class BaseMovieDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailsModel> getMovieDetails(int movieId);
  Future<List<MovieRecommendationModel>> getMovieRecommendations(int movieId);
}

class MovieDataSource implements BaseMovieDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final repsonse = await DioHelper.getData(
      path: 'movie/now_playing',
      apiKey: ApiConstance.apiKey,
    );
    return getMethodImplementation(repsonse);
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final repsonse = await DioHelper.getData(
      path: 'movie/popular',
      apiKey: ApiConstance.apiKey,
    );
    return getMethodImplementation(repsonse);
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final repsonse = await DioHelper.getData(
      path: 'movie/top_rated',
      apiKey: ApiConstance.apiKey,
    );
    return getMethodImplementation(repsonse);
  }

  List<MovieModel> getMethodImplementation(Response<dynamic> repsonse) {
    if (repsonse.statusCode == 200) {
      return List<MovieModel>.from(
        (repsonse.data['results'] as List).map(
          (movieData) => MovieModel.fromJson(movieData),
        ),
      );
    } else {
      throw ServerException(
        errorModel: ErrorModel.fromJson(repsonse.data),
      );
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(int movieId) async {
    final repsonse = await DioHelper.getData(
      path: 'movie/$movieId',
      apiKey: ApiConstance.apiKey,
    );
    if (repsonse.statusCode == 200) {
      return MovieDetailsModel.fromJson(repsonse.data);
    } else {
      throw ServerException(
        errorModel: ErrorModel.fromJson(repsonse.data),
      );
    }
  }

  @override
  Future<List<MovieRecommendationModel>> getMovieRecommendations(
      int movieId) async {
    final repsonse = await DioHelper.getData(
      path: 'movie/$movieId/recommendations',
      apiKey: ApiConstance.apiKey,
    );
    if (repsonse.statusCode == 200) {
      return List<MovieRecommendationModel>.from((repsonse.data['results'] as List)
          .map((e) => MovieRecommendationModel.fromJson(e)));
    } else {
      throw ServerException(
        errorModel: ErrorModel.fromJson(repsonse.data),
      );
    }
  }
}
