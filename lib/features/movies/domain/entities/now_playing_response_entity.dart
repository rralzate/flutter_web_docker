import 'result_playing_movies_entity.dart';

class NowPlayingResponseEntity {
  final int page;
  final List<ResultPlayingMoviesEntity> movies;
  final int totalPages;
  final int totalResults;

  NowPlayingResponseEntity({
    required this.page,
    required this.movies,
    required this.totalPages,
    required this.totalResults,
  });

  NowPlayingResponseEntity.empty()
      : page = 0,
        movies = [],
        totalPages = 0,
        totalResults = 0;
}
