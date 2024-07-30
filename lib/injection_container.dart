import 'package:flutter_web_docker/features/movies/data/datasource/movies_datasource_impl.dart';
import 'package:flutter_web_docker/features/movies/presentation/bloc/movies_bloc.dart';
import 'package:get_it/get_it.dart';

import 'core/network/network_info.dart';
import 'core/network/server_api_client.dart';
import 'features/auth/data/datasource/auth_datasource.dart';
import 'features/auth/data/datasource/auth_datasource_impl.dart';
import 'features/auth/data/datasource/auth_storage_repository.dart';
import 'features/auth/data/datasource/auth_storage_repository_impl.dart';
import 'features/auth/data/repositories/auth_repositories_impl.dart';
import 'features/auth/domain/repositories/auth_repository.dart';
import 'features/auth/domain/usescases/get_auth_storage_usecase.dart';
import 'features/auth/domain/usescases/post_login_usecase.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/home/presentation/bloc/home_bloc.dart';
import 'features/movies/data/datasource/movies_datasource.dart';
import 'features/movies/data/repositories/movies_repositories_impl.dart';
import 'features/movies/domain/repositories/movies_repository.dart';
import 'features/movies/domain/usescases/get_on_display_movies_usecase.dart';
import 'features/movies/domain/usescases/get_popular_movies_usecase.dart';

final getIt = GetIt.instance;
Future<void> injectDependencies() async {
  getIt.registerFactory(() => AuthBloc(
        postLoginUseCase: getIt(),
        getAuthStorageUseCase: getIt(),
      ));

  getIt.registerFactory(() => HomeBloc(
        authBloc: getIt(),
      ));

  getIt.registerFactory(() => MoviesBloc(
        getOnDisplayMoviesUseCase: getIt(),
        getPopularMoviesUseCase: getIt(),
      ));

  //! UseCases
  //Login
  getIt.registerLazySingleton(() => PostLoginUseCase(repository: getIt()));
  getIt.registerLazySingleton(() => GetAuthStorageUseCase(repository: getIt()));

  //Movies
  getIt.registerLazySingleton(
      () => GetOnDisplayMoviesUseCase(repository: getIt()));
  getIt.registerLazySingleton(
      () => GetPopularMoviesUseCase(repository: getIt()));

  //! Repository
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImp(
      authStorageRepository: getIt(),
      authDataSource: getIt(),
      apiClient: getIt(),
    ),
  );

  getIt.registerLazySingleton<MoviesRepository>(
    () => MoviesRepositoryImp(
      moviesDatasource: getIt(),
      apiClient: getIt(),
    ),
  );

  //!Data Source
  getIt.registerLazySingleton<AuthDatasource>(() => AuthDatasourceImpl(
        apiClient: getIt(),
      ));

  getIt.registerLazySingleton<MoviesDatasource>(() => MoviesDatasourceImpl(
        apiClient: getIt(),
      ));

  //! local storage actions
  getIt.registerLazySingleton<AuthStorageRepository>(
      () => AuthStorageRepositoryImpl());

  //! Server Api Client to Http consume rest apis
  getIt.registerLazySingleton(
    () => ServerApiClient(
      networkInfoRepository: getIt(),
    ),
  );
  //!Core
  // Network Handler
  getIt.registerLazySingleton<NetworkInfoRepository>(
      () => NetworkInfoRepositoryImpl());
}
