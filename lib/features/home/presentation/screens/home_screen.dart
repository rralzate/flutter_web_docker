import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_docker/core/components/custom_loading.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/constants/blocs.dart';
import '../../../../core/services/notifications_service.dart';
import '../../../../core/utils/constants.dart';

import 'package:flutter/material.dart';

import '../../../movies/domain/entities/result_playing_movies_entity.dart';
import '../../../movies/presentation/bloc/movies_bloc.dart';
import '../widgets/card_swiper.dart';
import '../widgets/movie_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = false;

  List<ResultPlayingMoviesEntity> onDisplaymovies = [];
  List<ResultPlayingMoviesEntity> popularMovies = [];

  @override
  void initState() {
    moviesBloc.add(const GetOnDisplayMoviesEvent());

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocProvider.value(
        value: moviesBloc,
        child: BlocConsumer<MoviesBloc, MoviesState>(
          listener: (context, state) {
            // ------// ------// ------// ------// ------// ------// ------
            if (state is LoadingOnDisplayMoviesState) {
              _isLoading = true;
            }
            if (state is FailedOnDisplayMoviesState) {
              _isLoading = false;
              _setErrors(state);
            }
            if (state is SuccessOnDisplayMoviesState) {
              _isLoading = false;
              onDisplaymovies = state.moviesEntity.movies;
              moviesBloc.add(const GetPopularMoviesEvent());
            }
            // ------// ------// ------// ------// ------// ------// ------
            if (state is LoadingPopularMoviesState) {
              _isLoading = true;
            }
            if (state is FailedPopularMoviesState) {
              _isLoading = false;
              _setErrorsPopularMovies(state);
            }
            if (state is SuccessPopularMoviesState) {
              _isLoading = false;
              popularMovies = [...popularMovies, ...state.moviesEntity.movies];
            }
          },
          builder: (context, state) {
            return Stack(children: [
              _PrincipalBody(
                onDisplaymovies: onDisplaymovies,
                popularMovies: popularMovies,
              ),
              Visibility(
                visible: _isLoading,
                child: const CustomLoadingScreen(),
              )
            ]);
          },
        ),
      ),
    );
  }

  void _setErrors(FailedOnDisplayMoviesState state) {
    if (state.error == Constants.internetFailureMessage) {
      _errorMessage('No hay conexion a Internet');
    }
    if (state.error == Constants.serverFailureMessage) {
      _errorMessage(state.message);
    }
    if (state.error == Constants.authenticationFailureMessage) {
      _errorMessage('Usuario o clave invalido');
    }
  }

  void _setErrorsPopularMovies(FailedPopularMoviesState state) {
    if (state.error == Constants.internetFailureMessage) {
      _errorMessage('No hay conexion a Internet');
    }
    if (state.error == Constants.serverFailureMessage) {
      _errorMessage(state.message);
    }
    if (state.error == Constants.authenticationFailureMessage) {
      _errorMessage('Usuario o clave invalido');
    }
  }

  Future<void> _errorMessage(String message) async {
    NotificationsService.showSnackbarError(message);
  }
}

class _PrincipalBody extends StatelessWidget {
  const _PrincipalBody(
      {required this.onDisplaymovies, required this.popularMovies});

  final List<ResultPlayingMoviesEntity> onDisplaymovies;
  final List<ResultPlayingMoviesEntity> popularMovies;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 2.h,
        ),
        CardSwiper(
          onDisplaymovies: onDisplaymovies,
        ),
        SizedBox(
          height: 3.h,
        ),
        MovieSlider(
          popularMovies: popularMovies,
          title: 'Populares',
        ),
      ],
    );
  }
}
