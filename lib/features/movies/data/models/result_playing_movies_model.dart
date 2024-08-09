import '../../domain/entities/result_playing_movies_entity.dart';

class ResultPlayingMoviesModel extends ResultPlayingMoviesEntity {
  ResultPlayingMoviesModel({
    required super.adult,
    required super.backdropPath,
    required super.genreIds,
    required super.id,
    required super.originalTitle,
    required super.overview,
    required super.popularity,
    required super.posterPath,
    required super.releaseDate,
    required super.title,
    required super.video,
    required super.voteAverage,
    required super.voteCount,
  });

  factory ResultPlayingMoviesModel.fromJson(Map<String, dynamic> json) =>
      ResultPlayingMoviesModel(
        adult: json["adult"] ?? false,
        backdropPath: json["backdrop_path"] ?? 'https://picsum.photos/200/300',
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"] ?? 0,
        originalTitle: json["original_title"] ?? '',
        overview: json["overview"] ?? '',
        popularity: json["popularity"]?.toDouble() ?? 0,
        posterPath: json["poster_path"] ?? 'https://picsum.photos/200/300',
        releaseDate: DateTime.parse(json["release_date"]),
        title: json["title"] ?? '',
        video: json["video"] ?? false,
        voteAverage: json["vote_average"]?.toDouble() ?? 0,
        voteCount: json["vote_count"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "id": id,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}
