import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:task/constants/movie_api.dart';
import 'package:task/view/home/widgets/search.dart';

import '../data/model/movie_data.dart';
import '../data/remote/dio_helper.dart';

class GetMoviesRepo {
  final DioHelper dioHelper;

  GetMoviesRepo({
    required this.dioHelper,
  });

  Future<MoviesDataListModel> getMovies() async {
    try {
      final Response response = await dioHelper.getData(url: MovieApi.movieUrl);
      var data = jsonDecode(response.data) as Map<String, dynamic>;
      final MoviesDataListModel moviesDataListModel =
          MoviesDataListModel.fromMap(data);
      return moviesDataListModel;
    } on DioError catch (dioError) {
      throw dioError.message;
    } catch (error) {
      throw '..Oops $error';
    }
  }

  Future<MoviesDataListModel> search({required String value}) async {
    try {
      final Response response =
          await dioHelper.getData(url: "${MovieApi.movieUrl}?q=$value");
      var data = jsonDecode(response.data) as Map<String, dynamic>;
      final MoviesDataListModel moviesDataListModel =
          MoviesDataListModel.fromMap(data);
      return moviesDataListModel;
    } on DioError catch (dioError) {
      throw dioError.message;
    } catch (error) {
      throw '..Oops $error';
    }
  }
}
