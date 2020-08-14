part of 'home_bloc.dart';

abstract class HomeState {
  const HomeState();
}

class HomeInitial extends HomeState {}

class HomeSuccess extends HomeState {
  final Home _home;

  HomeSuccess(
    this._home,
  );

  Home get home => _home;
}

class HomeLoading extends HomeState {}

class HomeFail extends HomeState {}

class HomeError extends HomeState {}
