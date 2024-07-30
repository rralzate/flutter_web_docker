import 'dart:convert';

import '../../domain/entities/popular_response_entity.dart';
import 'result_playing_movies_model.dart';

PopularResponseModel popularResponseModelFromJson(String str) =>
    PopularResponseModel.fromJson(json.decode(str));

class PopularResponseModel extends PopularResponseEntity {
  PopularResponseModel({
    required super.page,
    required super.movies,
    required super.totalPages,
    required super.totalResults,
  });

  factory PopularResponseModel.fromJson(Map<String, dynamic> json) =>
      PopularResponseModel(
        page: json["page"] ?? 0,
        movies: List<ResultPlayingMoviesModel>.from(
            json["results"].map((x) => ResultPlayingMoviesModel.fromJson(x))),
        totalPages: json["total_pages"] ?? 0,
        totalResults: json["total_results"] ?? 0,
      );
}
