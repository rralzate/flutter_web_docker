import 'package:dartz/dartz.dart';

import '../../../../core/network/failure.dart';
import '../../../../core/usescases/usescases.dart';
import '../repositories/auth_repository.dart';

class GetAuthStorageUseCase
    implements UseCase<UseCaseGetAuthStorageResult, NoParams> {
  final AuthRepository repository;

  GetAuthStorageUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failure, UseCaseGetAuthStorageResult>> call(
      NoParams params) async {
    final result = await repository.getSecureUserInfoStorage();

    return result.fold(
      (failure) => Left(failure),
      (resp) => Right(UseCaseGetAuthStorageResult(
        result: resp.result,
      )),
    );
  }
}

class UseCaseGetAuthStorageResult {
  final String result;
  UseCaseGetAuthStorageResult({
    required this.result,
  });
}
