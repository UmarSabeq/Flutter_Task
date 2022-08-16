part of 'movie_cubit.dart';

abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class MovieLoaded extends MovieState {
  final MoviesDataListModel moviesDataListModel;
  const MovieLoaded({required this.moviesDataListModel});
  @override
  List<Object> get props => [moviesDataListModel];
}

class MovieError extends MovieState {
  final String error;
  const MovieError({required this.error});
  @override
  List<Object> get props => [error];
}
