part of 'menu_detail_bloc.dart';

abstract class MenuDetailState extends Equatable {
  const MenuDetailState();
  
  @override
  List<Object> get props => [];
}

class MenuDetailInitial extends MenuDetailState {}

class Loading extends MenuDetailState {}

class Error extends MenuDetailState {
  final String error;

  Error(this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'Error { error: $error }';
}

class MenuLoaded extends MenuDetailState {
  final List<MenuDetail> menuDetails;

  MenuLoaded(this.menuDetails);

  @override
  List<Object> get props => [menuDetails];

  @override
  bool get stringify => true;
}

class ShowMessage extends MenuDetailState {
  final String message;

  ShowMessage(this.message);

  @override
  List<Object> get props => [message];

  @override
  bool get stringify => false;
}
