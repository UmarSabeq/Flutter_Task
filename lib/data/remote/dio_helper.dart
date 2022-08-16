import 'package:dio/dio.dart';

class DioHelper {
  final Dio dio;

  DioHelper({
    required this.dio,
  });

  Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
  }) {
    dio.options.headers['Authorization'] = 'Bearer Wookie2021';

    return dio.get(
      url,
      queryParameters: query,
      options: Options(responseType: ResponseType.plain),
    );
  }
}
