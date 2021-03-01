part of 'menu_bloc.dart';

abstract class MenuState extends Equatable {
  const MenuState();

  @override
  List<Object> get props => [];
}

class MenuInitial extends MenuState {}

class Loading extends MenuState {}

class Error extends MenuState {
  final String error;

  Error(this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'Error { error: $error }';
}

class MenuLoaded extends MenuState {
  final List<Menu> menus;

  MenuLoaded(this.menus);

  @override
  List<Object> get props => [menus];

  @override
  bool get stringify => true;
}

class ShowMessage extends MenuState {
  final String message;

  ShowMessage(this.message);

  @override
  List<Object> get props => [message];

  @override
  bool get stringify => false;
}
