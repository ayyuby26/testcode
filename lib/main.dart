import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testcode/blocs/home/home_bloc.dart';
import 'package:testcode/blocs/login/login_bloc.dart';
import 'package:testcode/views/second_page.dart';
import 'constant.dart';
import 'views/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(create: (context) => LoginBloc()),
        BlocProvider<HomeBloc>(create: (context) => HomeBloc()),
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/secondPage': (context) => SecondPage(),
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: backColor,
          accentColor: secondaryColor,
        ),
        home: LoginPage(),
      ),
    );
  }
}
