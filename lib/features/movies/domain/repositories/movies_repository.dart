import 'package:dartz/dartz.dart';

import '../../../../core/network/failure.dart';
import '../entities/now_playing_response_entity.dart';
import '../entities/popular_response_entity.dart';

abstract class MoviesRepository {
  /// abstract method for post Login
  Future<Either<Failure, NowPlayingResponseEntity>> getOnDisplayMovies();

  Future<Either<Failure, PopularResponseEntity>> getPopularMovies();
}
