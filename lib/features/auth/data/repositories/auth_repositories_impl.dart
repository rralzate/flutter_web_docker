import '../../domain/usescases/get_auth_storage_usecase.dart';
import '../../domain/usescases/post_login_usecase.dart';

import '../../../../core/network/failure.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/network/exception.dart';
import '../../../../core/network/server_api_client.dart';

import '../../domain/repositories/auth_repository.dart';
import '../datasource/auth_datasource.dart';
import '../datasource/auth_storage_repository.dart';

class AuthRepositoryImp implements AuthRepository {
  //final LocalStorageRepository localStorageRepository;
  final AuthDatasource authDataSource;
  final ServerApiClient apiClient;
  final AuthStorageRepository authStorageRepository;

  AuthRepositoryImp({
    required this.authDataSource,
    required this.apiClient,
    required this.authStorageRepository,
  });
  @override
  Future<Either<Failure, UseCasePostLoginResult>> login(
      {required String email, required String password}) async {
    try {
      //final result = await authDataSource.login(email, password);

      apiClient.setAccessToken(
          accessToken:
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4YjA5ZDEyMDljZGNjMGI0MmI0NWQ2MjI1ODE0MzU1NiIsIm5iZiI6MTcyMjA4NDYwOS43MjM0NTgsInN1YiI6IjYxODBhMjk1ZDM4OGFlMDA2MTIyOWY0OSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Z9gZT6-3SIf4pBamPWHiF0ZKfzN6uxS-MEh9sFyXJKI');

      String _token = 'dsdsdsdsdsafdsfdsfdsfsdfdsfdsfds';

      authStorageRepository.setSecureUserInfoStorage(token: _token);

      print('Alamcenar JWT:  $_token');

      if (_token.isNotEmpty) {
        //set token info un local storage
        await authStorageRepository.setSecureUserInfoStorage(token: _token);
        //Set access token
        apiClient.setAccessToken(accessToken: _token);
      }

      return Right(
        UseCasePostLoginResult(result: _token),
      );
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
  Future<Either<Failure, UseCaseGetAuthStorageResult>>
      getSecureUserInfoStorage() async {
    try {
      final result = await authStorageRepository.getSecureUserInfoStorage();

      return Right(
        UseCaseGetAuthStorageResult(result: result),
      );
    } on ServerException catch (e) {
      return Left(ServerFailure(
        message: e.message,
        code: e.code,
      ));
    } on Object catch (e) {
      return Left(ErrorFailure(error: e));
    }
  }
}
