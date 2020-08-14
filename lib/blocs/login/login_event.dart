part of 'login_bloc.dart';

abstract class LoginEvent {
  const LoginEvent();
}

class LoginBlocEvent extends LoginEvent {
  final String _user, _pass;

  LoginBlocEvent(this._user, this._pass);
}
