import 'package:flutter_web_docker/features/movies/domain/entities/now_playing_response_entity.dart';
import 'package:flutter_web_docker/features/movies/domain/entities/popular_response_entity.dart';

import '../../../../core/network/failure.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/network/exception.dart';
import '../../../../core/network/server_api_client.dart';

import '../../domain/repositories/movies_repository.dart';
import '../datasource/movies_datasource.dart';

class MoviesRepositoryImp implements MoviesRepository {
  //final LocalStorageRepository localStorageRepository;
  final MoviesDatasource moviesDatasource;
  final ServerApiClient apiClient;

  MoviesRepositoryImp({
    required this.moviesDatasource,
    required this.apiClient,
  });

  @override
  Future<Either<Failure, NowPlayingResponseEntity>> getOnDisplayMovies() async {
    try {
      final result = await moviesDatasource.getOnDisplayMovies();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(
        message: e.message,
        code: e.code,
      ));
    } on AuthenticationException {
      return Left(AuthenticationFailure());
    } on ConnectionException {
      return Left(ConnectionFailure());
    } on Object catch (e) {
      return Left(ErrorFailure(error: e));
    }
  }

  @override
  Future<Either<Failure, PopularResponseEntity>> getPopularMovies() async {
    try {
      final result = await moviesDatasource.getPopularMovies();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(
        message: e.message,
        code: e.code,
      ));
    } on AuthenticationException {
      return Left(AuthenticationFailure());
    } on ConnectionException {
      return Left(ConnectionFailure());
    } on Object catch (e) {
      return Left(ErrorFailure(error: e));
    }
  }
}
