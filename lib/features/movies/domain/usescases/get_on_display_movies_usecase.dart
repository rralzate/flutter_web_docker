import 'package:dartz/dartz.dart';

import '../../../../core/network/failure.dart';
import '../../../../core/usescases/usescases.dart';
import '../entities/now_playing_response_entity.dart';
import '../repositories/movies_repository.dart';

class GetOnDisplayMoviesUseCase
    implements UseCase<NowPlayingResponseEntity, NoParams> {
  final MoviesRepository repository;

  GetOnDisplayMoviesUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failure, NowPlayingResponseEntity>> call(
      NoParams params) async {
    final result = await repository.getOnDisplayMovies();

    return result.fold(
      (failure) => Left(failure),
      (resp) => Right(resp),
    );
  }
}
