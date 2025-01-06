import 'package:dio/dio.dart';
import 'package:movie_hub/core/utils/api_constance.dart';

abstract class DioHelper {
  static late Dio _dio;

  static init() {
    _dio = Dio(BaseOptions(
      baseUrl: ApiConstance.baseUrl,
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData(
      {required String path, required String apiKey}) async {
    return await _dio.get('$path?api_key=$apiKey');
  }
}
