import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:testcode/models/login.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginBlocEvent) {
      yield LoginLoading();
      try {
        Login _login = await Login.getLogin(event._user, event._pass);
        if (_login.success == true)
          yield LoginSucces(_login.jwt);
        else
          yield LoginFailed(_login);
      } catch (_) {
        yield LoginError();
      }
    }
  }
}
