import '../../../auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  static late AnimationController menuController;
  final AuthBloc authBloc;

  static Animation<double> movement = Tween<double>(begin: -250, end: 0)
      .animate(
          CurvedAnimation(parent: menuController, curve: Curves.easeInOut));

  static Animation<double> opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: menuController, curve: Curves.easeInOut));

  HomeBloc({
    required this.authBloc,
  }) : super(HomeInitial()) {
    on<IsOpenEvent>(
        (event, emit) => emit(state.copyWith(isOpen: event.isOpen)));

    on<OpenMenuEvent>((event, emit) async {
      await _openMenu(event: event, emit: emit);
    });

    on<CloseMenuEvent>((event, emit) async {
      await _closeMenu(event: event, emit: emit);
    });

    on<SetCurrentScreenEvent>((event, emit) async {
      emit(await _currentScreen(event: event, emit: emit));
    });
  }

  Future<void> _openMenu({
    required OpenMenuEvent event,
    required Emitter<HomeState> emit,
  }) async {
    add(const IsOpenEvent(isOpen: true));
    menuController.forward();
  }

  Future<void> _closeMenu({
    required CloseMenuEvent event,
    required Emitter<HomeState> emit,
  }) async {
    add(const IsOpenEvent(isOpen: false));
    menuController.reverse();
  }

  Future<void> toogleMenu() async {
    (state.isOpen) ? menuController.reverse() : menuController.forward();

    add(IsOpenEvent(isOpen: !state.isOpen));
  }

  Future<HomeState> _currentScreen({
    required SetCurrentScreenEvent event,
    required Emitter<HomeState> emit,
  }) async {
    emit(SuccessCurrentScreenState(currentScreenState: event.currentScreen));
    return SetCurrentScreenState(currentScreenState: event.currentScreen);
  }
}
