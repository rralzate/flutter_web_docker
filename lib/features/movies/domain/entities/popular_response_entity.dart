import 'result_playing_movies_entity.dart';

class PopularResponseEntity {
  final int page;
  final List<ResultPlayingMoviesEntity> movies;
  final int totalPages;
  final int totalResults;

  PopularResponseEntity({
    required this.page,
    required this.movies,
    required this.totalPages,
    required this.totalResults,
  });

  PopularResponseEntity.empty()
      : page = 0,
        movies = [],
        totalPages = 0,
        totalResults = 0;
}
