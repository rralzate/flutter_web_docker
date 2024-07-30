part of 'movies_bloc.dart';

sealed class MoviesState extends Equatable {
  const MoviesState();

  @override
  List<Object?> get props => [];
}

final class MoviesInitial extends MoviesState {}

//  -------------------------/// ------------------------- Class for user On Display Movies State /// ----------------------------/// -----------------------------------///

class LoadingOnDisplayMoviesState extends MoviesState {
  @override
  List<Object?> get props => [];
}

class FailedOnDisplayMoviesState extends MoviesState {
  final String error;
  final String message;

  const FailedOnDisplayMoviesState(
      {required this.error, required this.message});
  @override
  List<Object?> get props => [];
}

class GetOnDisplayMoviesState extends MoviesState {
  final NowPlayingResponseEntity moviesEntity;

  const GetOnDisplayMoviesState({
    required this.moviesEntity,
  });

  @override
  List<Object?> get props => [moviesEntity];

  @override
  String toString() {
    return '''
      Get Movies: 
        Movie: ${moviesEntity.toString()}
    ''';
  }
}

class SuccessOnDisplayMoviesState extends MoviesState {
  final NowPlayingResponseEntity moviesEntity;

  const SuccessOnDisplayMoviesState({
    required this.moviesEntity,
  });

  @override
  List<Object?> get props => [];
}

/// --------------------------------------------------/// -----------------------------------/// -----------------------------------/// -----------------------------------

//  -------------------------/// ------------------------- Class for PopularMovies State /// ----------------------------/// -----------------------------------///

class LoadingPopularMoviesState extends MoviesState {
  @override
  List<Object?> get props => [];
}

class FailedPopularMoviesState extends MoviesState {
  final String error;
  final String message;

  const FailedPopularMoviesState({required this.error, required this.message});
  @override
  List<Object?> get props => [];
}

class GetPopularMoviesState extends MoviesState {
  final PopularResponseEntity moviesEntity;

  const GetPopularMoviesState({
    required this.moviesEntity,
  });

  @override
  List<Object?> get props => [moviesEntity];

  @override
  String toString() {
    return '''
      Get Movies: 
        Movie: ${moviesEntity.toString()}
    ''';
  }
}

class SuccessPopularMoviesState extends MoviesState {
  final PopularResponseEntity moviesEntity;

  const SuccessPopularMoviesState({
    required this.moviesEntity,
  });

  @override
  List<Object?> get props => [];
}

/// --------------------------------------------------/// -----------------------------------/// -----------------------------------/// -----------------------------------
