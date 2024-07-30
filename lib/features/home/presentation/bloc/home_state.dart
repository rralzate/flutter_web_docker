part of 'home_bloc.dart';

class HomeState extends Equatable {
  final bool isOpen;

  const HomeState({
    this.isOpen = false,
  });

  HomeState copyWith({
    bool? isOpen,
  }) =>
      HomeState(
        isOpen: isOpen ?? this.isOpen,
      );

  @override
  List<Object?> get props => [
        isOpen,
      ];
}

final class HomeInitial extends HomeState {}

class OpenMenuState extends HomeState {
  @override
  List<Object?> get props => [];
}

class CloseMenuState extends HomeState {
  @override
  List<Object?> get props => [];
}

// --- Class for user storage  information State /// -----------------------------------/// -----------------------------------/// -----------------------------------

class SetCurrentScreenState extends HomeState {
  final String currentScreenState;

  const SetCurrentScreenState({
    required this.currentScreenState,
  });

  @override
  List<Object?> get props => [currentScreenState];

  @override
  String toString() {
    return ''' 
      Get Token: 
        Tolken: ${currentScreenState.toString()}
    ''';
  }
}

class SuccessCurrentScreenState extends HomeState {
  final String currentScreenState;

  const SuccessCurrentScreenState({
    required this.currentScreenState,
  });

  @override
  List<Object?> get props => [];
}
