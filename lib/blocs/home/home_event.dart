part of 'home_bloc.dart';

abstract class HomeEvent {
  const HomeEvent();
}

class HomeBlocEvent extends HomeEvent {
  final String _jwt;

  HomeBlocEvent(this._jwt);
}
