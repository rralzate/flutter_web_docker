import 'package:flutter_web_docker/features/movies/presentation/bloc/movies_bloc.dart';

import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../injection_container.dart';

/// Authentication
final AuthBloc authBloc = getIt<AuthBloc>();

//movies
final MoviesBloc moviesBloc = getIt<MoviesBloc>();
