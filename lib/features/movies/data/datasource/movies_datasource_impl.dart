import 'dart:convert';

import 'package:flutter_web_docker/core/network/server_info.dart';
import 'package:flutter_web_docker/features/movies/data/models/now_playing_response_model.dart';

import '../../../../core/network/server_api_client.dart';
import '../../../../core/network/server_api_constants.dart';
import '../models/popular_response_model.dart';
import 'movies_datasource.dart';

class MoviesDatasourceImpl implements MoviesDatasource {
  final ServerApiClient apiClient;

  MoviesDatasourceImpl({required this.apiClient});

  @override
  Future<NowPlayingResponseModel> getOnDisplayMovies() async {
    final result = await apiClient.get(
      serverAuthorityApiMovies,
      ServerApiConstants.getOnDisplayMoviesEndpoint,
      serverSchema,
      queryParameters: {'language': 'en-US', 'page': '1'},
    );
    return NowPlayingResponseModel.fromJson(jsonDecode(result.body));
  }

  @override
  Future<PopularResponseModel> getPopularMovies() async {
    final result = await apiClient.get(
      serverAuthorityApiMovies,
      ServerApiConstants.getOnPopularMoviesEndpoint,
      serverSchema,
      queryParameters: {'language': 'en-US', 'page': '1'},
    );

    final poluparResponse =
        PopularResponseModel.fromJson(jsonDecode(result.body));

    return poluparResponse;
  }
}
