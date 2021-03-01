import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dayalima_test/src/data/models/response/menu.dart';
import 'package:dayalima_test/src/data/repositories/menu_repository.dart';
import 'package:dayalima_test/src/data/result.dart';
import 'package:equatable/equatable.dart';

part 'menu_event.dart';
part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  MenuBloc(
    this.menuRepository,
  ) : super(MenuInitial());

  final MenuRepository menuRepository;

  List<Menu> menus = List();

  @override
  Stream<MenuState> mapEventToState(
    MenuEvent event,
  ) async* {
    if (event is GetMenus) {
      yield* _getAllMenus();
    } else if (event is Refresh) {
      yield* _refresh();
    } 
  }

  Stream<MenuState> _getAllMenus() async* {
    try {
      yield Loading();
      Result result = await menuRepository.fetchMenu();
      menus.addAll(result.data);
      yield MenuLoaded(menus);
    } catch (e) {
      var result = Result.fromError(e);
      yield Error(result.message);
    }
  }


  Stream<MenuState> _refresh() async* {
    try {
      yield Loading();
      Result result = await menuRepository.fetchMenu();
      menus.clear();
      menus.addAll(result.data);
      yield MenuLoaded(menus);
    } catch (e) {
      var result = Result.fromError(e);
      yield Error(result.message);
    }
  }
}
