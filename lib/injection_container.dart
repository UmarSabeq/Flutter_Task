import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:task/cubit/movie_cubit.dart';
import 'package:task/data/remote/dio_helper.dart';
import 'package:task/repositories/get_movie_repo.dart';

import 'constants/movie_api.dart';

final GetIt getIt = GetIt.instance;

Future<void> init() async {
// Cubit
  getIt.registerFactory(() => MovieCubit(getMoviesRepo: getIt()));
  // Repository
  getIt.registerLazySingleton(() => GetMoviesRepo(dioHelper: getIt()));
  // External
  getIt.registerLazySingleton(() => DioHelper(
        dio: getIt(),
      ));
  getIt.registerLazySingleton(
    () => Dio(
      BaseOptions(
        baseUrl: MovieApi.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    ),
  );
}
