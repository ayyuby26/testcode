part of 'login_bloc.dart';

abstract class LoginState {
  const LoginState();
}

class LoginInitial extends LoginState {}

class LoginSucces extends LoginState {
  final String _login;

  LoginSucces(this._login);
  

  @override
  List<Object> get props => [_login];
}

class LoginFailed extends LoginState {
  final Login _login;

  LoginFailed(this._login);
  
  @override
  List<Object> get props => [_login];
}

class LoginLoading extends LoginState{}

class LoginError extends LoginState{}
