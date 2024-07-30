import 'package:fluro/fluro.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_web_docker/features/auth/presentation/screens/register_screen.dart';
import 'package:flutter_web_docker/features/home/presentation/screens/home_screen.dart';

import '../../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../../features/auth/presentation/screens/login_screen.dart';

//! Login view handler
class AdminHandlers {
  static Handler login =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    final authState = BlocProvider.of<AuthBloc>(context!).state;

    if (authState.isAuthenticated) {
      return const HomeScreen();
    } else {
      return const LoginScreen();
    }
  });

  static Handler register =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    final authState = BlocProvider.of<AuthBloc>(context!).state;

    if (authState.isAuthenticated) {
      return const HomeScreen();
    } else {
      return const RegisterScreen();
    }
  });
}
