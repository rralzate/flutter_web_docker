import 'package:dartz/dartz.dart';

import '../../../../core/network/failure.dart';
import '../usescases/get_auth_storage_usecase.dart';
import '../usescases/post_login_usecase.dart';

abstract class AuthRepository {
  /// abstract method for post Login
  Future<Either<Failure, UseCasePostLoginResult>> login(
      {required String email, required String password});

  Future<Either<Failure, UseCaseGetAuthStorageResult>>
      getSecureUserInfoStorage();
}
