import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:task/data/model/movie_data.dart';
import 'package:task/repositories/get_movie_repo.dart';
import 'package:task/view/home/widgets/search.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit({required this.getMoviesRepo}) : super(MovieInitial());
  final GetMoviesRepo getMoviesRepo;

  getMovies() async {
    emit(MovieLoading());
    try {
      MoviesDataListModel moviesDataListModel = await getMoviesRepo.getMovies();
      emit(MovieLoaded(moviesDataListModel: moviesDataListModel));
    } catch (e) {
      emit(MovieError(error: e.toString()));
    }
  }

  search({required String value}) async {
    emit(MovieLoading());
    try {
      MoviesDataListModel moviesDataListModel =
          await getMoviesRepo.search(value: value);
      emit(MovieLoaded(moviesDataListModel: moviesDataListModel));
    } catch (e) {
      emit(MovieError(error: e.toString()));
    }
  }
}
