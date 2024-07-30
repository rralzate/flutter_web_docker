import 'package:dartz/dartz.dart';

import '../../../../core/network/failure.dart';
import '../../../../core/usescases/usescases.dart';

import '../entities/popular_response_entity.dart';
import '../repositories/movies_repository.dart';

class GetPopularMoviesUseCase
    implements UseCase<PopularResponseEntity, NoParams> {
  final MoviesRepository repository;

  GetPopularMoviesUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failure, PopularResponseEntity>> call(NoParams params) async {
    final result = await repository.getPopularMovies();

    return result.fold(
      (failure) => Left(failure),
      (resp) => Right(resp),
    );
  }
}
