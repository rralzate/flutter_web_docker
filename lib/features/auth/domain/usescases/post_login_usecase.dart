import 'package:dartz/dartz.dart';

import '../../../../core/network/failure.dart';
import '../../../../core/usescases/usescases.dart';
import '../repositories/auth_repository.dart';

class PostLoginUseCase
    implements UseCase<UseCasePostLoginResult, ParamsUseCasePostLogin> {
  final AuthRepository repository;

  PostLoginUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failure, UseCasePostLoginResult>> call(
      ParamsUseCasePostLogin params) async {
    final result = await repository.login(
      email: params.userName,
      password: params.password,
    );

    return result.fold(
      (failure) => Left(failure),
      (resp) => Right(UseCasePostLoginResult(
        result: resp.result,
      )),
    );
  }
}

class ParamsUseCasePostLogin {
  final String userName;
  final String password;

  const ParamsUseCasePostLogin({
    required this.userName,
    required this.password,
  });
}

class UseCasePostLoginResult {
  final String result;
  UseCasePostLoginResult({
    required this.result,
  });
}
