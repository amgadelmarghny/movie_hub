import 'package:dio/dio.dart';
import 'package:movie_hub/core/utils/app_constance.dart';

abstract class DioHelper {
  static late Dio _dio;

  static init() {
    _dio = Dio(BaseOptions(
      baseUrl: AppConstance.baseUrl,
      receiveDataWhenStatusError: true,
    ));
  }

  static  Future<Response> getData({required String path})async{
  return await  _dio.get(path);
  }
}
