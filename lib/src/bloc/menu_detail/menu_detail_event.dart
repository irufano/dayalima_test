part of 'menu_detail_bloc.dart';

abstract class MenuDetailEvent extends Equatable {
  const MenuDetailEvent();

  @override
  List<Object> get props => [];
}

class GetMenuDetails implements MenuDetailEvent {
  GetMenuDetails(this.data);

  final String data;

  @override
  List<Object> get props => [data];

  @override
  bool get stringify => true;
}

class Refresh implements MenuDetailEvent {
  Refresh(this.data);

  final String data;

  @override
  List<Object> get props => [data];

  @override
  bool get stringify => false;
}
