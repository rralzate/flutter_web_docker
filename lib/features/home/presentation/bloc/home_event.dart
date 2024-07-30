part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();
}

class IsOpenEvent extends HomeEvent {
  final bool isOpen;

  const IsOpenEvent({required this.isOpen});
  @override
  List<Object?> get props => [];
}

class OpenMenuEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class CloseMenuEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class SetCurrentScreenEvent extends HomeEvent {
  final String currentScreen;

  const SetCurrentScreenEvent({required this.currentScreen});
  @override
  List<Object?> get props => [currentScreen];
}

class LogOutEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}
