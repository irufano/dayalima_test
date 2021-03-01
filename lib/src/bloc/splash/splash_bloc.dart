import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dayalima_test/src/app/helpers/routes.dart';
import 'package:dayalima_test/src/app/services/locator_service.dart';
import 'package:dayalima_test/src/app/services/navigation_service.dart';
import 'package:equatable/equatable.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial());

  final navigationService = locator<NavigationService>();

  @override
  Stream<SplashState> mapEventToState(
    SplashEvent event,
  ) async* {
    if (event is SetSplash) {
      yield* _handleStartup(event);
    }
  }

  Stream<SplashState> _handleStartup(SetSplash event) async* {
    yield SplashLoading();
    //todo: add some actions like checking the connection etc.
    //I simulate the process with future delayed for 3 second
    await Future.delayed(Duration(seconds: 3));

    navigationService.replaceNavigateTo(Routes.MENU_PAGE);

    yield SplashLoaded();
  }
}
