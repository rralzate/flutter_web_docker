import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../../features/auth/presentation/screens/login_screen.dart';
import '../../../features/home/presentation/screens/home_screen.dart';
import 'package:fluro/fluro.dart';

//! Home view handler
class HomeHandler {
  static Handler home =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    final authState = BlocProvider.of<AuthBloc>(context!).state;
    if (authState.isAuthenticated) {
      return const HomeScreen();
    } else {
      return const LoginScreen();
    }
  });
}
