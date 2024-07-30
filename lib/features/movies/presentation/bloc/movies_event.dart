part of 'movies_bloc.dart';

sealed class MoviesEvent extends Equatable {
  const MoviesEvent();

  @override
  List<Object> get props => [];
}

// --------------------------------/// --------------------------------///GET GetOnDisplayMoviesEvent event /// -------------------------------/// -------------------------------///
class GetOnDisplayMoviesEvent extends MoviesEvent {
  const GetOnDisplayMoviesEvent();

  @override
  List<Object> get props => [];
}
// -----------------------------------///-----------------------------------///------------------------/// -----------------------------------/// ----------------------------------///

// --------------------------------/// --------------------------------///GET GetPopularMoviesEvent event /// -------------------------------/// -------------------------------///
class GetPopularMoviesEvent extends MoviesEvent {
  const GetPopularMoviesEvent();

  @override
  List<Object> get props => [];
}
// -----------------------------------///-----------------------------------///------------------------/// -----------------------------------/// ----------------------------------///

