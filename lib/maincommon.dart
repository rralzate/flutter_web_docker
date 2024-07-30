import 'core/components/custom_loading.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';

import 'features/auth/presentation/layout/auth_layout.dart';
import 'features/home/presentation/layout/home_layout.dart';
import 'injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'core/services/navigation_service.dart';
import 'core/routes/router.dart';

import 'core/routes/routes_constants.dart';
import 'core/services/notifications_service.dart';
import 'core/theme/app_theme.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final authBloc = getIt<AuthBloc>();
  bool _isLoading = false;
  String token = '';
  bool authenticated = false;

  @override
  void initState() {
    super.initState();
    processScreen();
  }

  @override
  void dispose() {
    authBloc.close();
    super.dispose();
  }

  Future<void> processScreen() async {
    authBloc.add(const GetUserStorageInfoEvent());

    await Future.delayed(const Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: authBloc,
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          // ------// ------// ------// ------// ------// ------// ------
          if (state is LoadingUserStorageInfoState) {
            _isLoading = true;
          }
          if (state is FailedUserStorageInfoState) {
            _isLoading = false;
          }
          if (state is SuccessUserStorageInfoState) {
            _isLoading = false;

            if (state.tokenEntity.isNotEmpty) {
              token = state.tokenEntity;
            }
          }
          if (state.isAuthenticated) {
            setState(() {
              authenticated = state.isAuthenticated;
            });
          }
        },
        builder: (context, state) {
          return _principalBody();
        },
      ),
    );
  }

  Widget _principalBody() {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'FLUTTER WEB',
          navigatorKey: NavigationService.navigatorKey,
          scaffoldMessengerKey: NotificationsService.messengerKey,
          initialRoute: RoutesConstants.rootRoute,
          onGenerateRoute: Flurorouter.router.generator,
          builder: (_, child) {
            if (_isLoading) {
              return const Center(
                child: CustomLoadingScreen(),
              );
            }
            if (authenticated) {
              return HomeLayout(child: child!);
            } else {
              return AuthLayout(child: child!);
            }
          },
          theme: appTheme,
        );
      },
    );
  }
}
