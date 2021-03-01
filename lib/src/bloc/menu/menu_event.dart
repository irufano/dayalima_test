part of 'menu_bloc.dart';

abstract class MenuEvent extends Equatable {
  const MenuEvent();

  @override
  List<Object> get props => [];
}

class GetMenus implements MenuEvent {
  @override
  List<Object> get props => [];

  @override
  bool get stringify => false;
}

class Refresh implements MenuEvent {
  @override
  List<Object> get props => [];

  @override
  bool get stringify => false;
}

