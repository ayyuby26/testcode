import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testcode/blocs/home/home_bloc.dart';
import 'package:testcode/blocs/login/login_bloc.dart';
import 'package:testcode/models/home.dart';
import '../constant.dart';
import '../style.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _userFocus = FocusNode(debugLabel: "user login");
  final _passFocus = FocusNode(debugLabel: "pass login");
  final _raisedFocus = FocusNode(debugLabel: "login button");
  final _userField = TextEditingController(text: "user");
  final _passField = TextEditingController(text: "1234");

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final LoginBloc loginBloc = BlocProvider.of<LoginBloc>(context);
    final HomeBloc homeBloc = BlocProvider.of<HomeBloc>(context);
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("Login",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  )),
              SizedBox(height: 10),
              TextField(
                focusNode: _userFocus,
                controller: _userField,
                decoration: loginDecor("u"),
                onSubmitted: (value) {
                  FocusScope.of(context).requestFocus(_passFocus);
                },
              ),
              SizedBox(height: 10),
              TextField(
                obscureText: true,
                focusNode: _passFocus,
                controller: _passField,
                decoration: loginDecor(""),
                onSubmitted: (value) {
                  FocusScope.of(context).requestFocus(_raisedFocus);
                },
              ),
              Container(
                decoration: BoxDecoration(boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: secondaryColor.withOpacity(.7),
                      blurRadius: 7,
                      offset: Offset(0, 5))
                ]),
                width: 300,
                height: 40,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: RaisedButton(
                    focusNode: _raisedFocus,
                    color: secondaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      FocusScope.of(context).requestFocus(_raisedFocus);
                      loginBloc.add(
                          LoginBlocEvent(_userField.text, _passField.text));
                    }),
              ),
              BlocListener<LoginBloc, LoginState>(
                listener: (context, state) async {
                  if (state is LoginLoading)
                    print("loading...");
                  else if (state is LoginSucces) {
                    Navigator.pushReplacementNamed(context, "/secondPage");
                    homeBloc.add(HomeBlocEvent(state.props[0].toString() ));
                  } else if (state is LoginFailed)
                    print("login fail");
                  else if (state is LoginError)
                    print("error server");
                  else
                    print("strange error");
                },
                child: SizedBox(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
