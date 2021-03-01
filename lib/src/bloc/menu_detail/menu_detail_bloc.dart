import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dayalima_test/src/data/models/response/menu_detail.dart';
import 'package:dayalima_test/src/data/repositories/menu_repository.dart';
import 'package:dayalima_test/src/data/result.dart';
import 'package:equatable/equatable.dart';

part 'menu_detail_event.dart';
part 'menu_detail_state.dart';

class MenuDetailBloc extends Bloc<MenuDetailEvent, MenuDetailState> {
  MenuDetailBloc(this.menuRepository) : super(MenuDetailInitial());

  final MenuRepository menuRepository;

  List<MenuDetail> menuDetails = List();

  @override
  Stream<MenuDetailState> mapEventToState(
    MenuDetailEvent event,
  ) async* {
    if (event is GetMenuDetails) {
      yield* _getMenuDetails(event);
    } else if (event is Refresh) {
      yield* _refresh(event);
    } 
  }

  Stream<MenuDetailState> _getMenuDetails(GetMenuDetails event) async* {
    try {
      yield Loading();
      Result result = await menuRepository.fetchMenuDetail(event.data);
      menuDetails.addAll(result.data);
      yield MenuLoaded(menuDetails);
    } catch (e) {
      var result = Result.fromError(e);
      yield Error(result.message);
    }
  }


  Stream<MenuDetailState> _refresh(Refresh event) async* {
    try {
      yield Loading();
      Result result = await menuRepository.fetchMenuDetail(event.data);
      menuDetails.clear();
      menuDetails.addAll(result.data);
      yield MenuLoaded(menuDetails);
    } catch (e) {
      var result = Result.fromError(e);
      yield Error(result.message);
    }
  }
}
