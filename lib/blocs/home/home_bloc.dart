import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:testcode/models/home.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial());

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is HomeBlocEvent) {
      yield HomeLoading();
      try {
        final Home home = await Home.getHome(event._jwt);
        if (home.banner.isNotEmpty) {
          yield HomeSuccess(home);
        } else
          yield HomeFail();
      } catch (_) {
        yield HomeError();
      }
    }
  }
}
