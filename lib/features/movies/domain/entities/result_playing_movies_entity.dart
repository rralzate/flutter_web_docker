class ResultPlayingMoviesEntity {
  final bool adult;
  final String backdropPath;
  final List<int> genreIds;
  final int id;

  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final DateTime releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  ResultPlayingMoviesEntity({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  ResultPlayingMoviesEntity.empty()
      : adult = false,
        backdropPath = '',
        genreIds = [],
        id = 0,
        originalTitle = '',
        overview = '',
        popularity = 0,
        posterPath = '',
        releaseDate = DateTime.now(),
        title = '',
        video = false,
        voteAverage = 0,
        voteCount = 0;
}
