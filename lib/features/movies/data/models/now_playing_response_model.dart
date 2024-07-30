// To parse this JSON data, do
//
//     final nowPlayingResponseModel = nowPlayingResponseModelFromJson(jsonString);

import 'dart:convert';

import '../../domain/entities/now_playing_response_entity.dart';
import 'dates_model.dart';
import 'result_playing_movies_model.dart';

NowPlayingResponseModel nowPlayingResponseModelFromJson(String str) =>
    NowPlayingResponseModel.fromJson(json.decode(str));

class NowPlayingResponseModel extends NowPlayingResponseEntity {
  NowPlayingResponseModel({
    required super.page,
    required super.movies,
    required super.totalPages,
    required super.totalResults,
  });

  factory NowPlayingResponseModel.fromJson(Map<String, dynamic> json) =>
      NowPlayingResponseModel(
        page: json["page"] ?? 0,
        movies: List<ResultPlayingMoviesModel>.from(
            json["results"].map((x) => ResultPlayingMoviesModel.fromJson(x))),
        totalPages: json["total_pages"] ?? 0,
        totalResults: json["total_results"] ?? 0,
      );
}
