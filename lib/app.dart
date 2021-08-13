import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms/logic/authentication/bloc/authentication_bloc.dart';
import 'package:vms/view/router/app_router.dart';

import 'logic/authentication/repository/authentication_repository.dart';
import 'logic/authentication/repository/user_repository.dart';

class App extends StatelessWidget {
  const App(
      {Key? key,
      required this.authenticationRepository,
      required this.userRepository})
      : super(key: key);

  final AuthenticationRepository authenticationRepository;
  final UserRepository userRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: authenticationRepository,
      child: BlocProvider<AuthenticationBloc>(
        create: (context) => AuthenticationBloc(
            authenticationRepository: authenticationRepository,
            userRepository: userRepository),
        child: AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final AppRouter _appRouter = AppRouter();
  final _navigatorKey = GlobalKey<NavigatorState>();
  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    Color _secondary = Color.fromARGB(255, 108, 117, 125),
        _primary = Color.fromARGB(255, 18, 40, 115),
        _black = Colors.black,
        _white = Colors.white,
        _primaryDark = Color.fromARGB(255, 8, 18, 50),
        _primaryLight = Color.fromARGB(255, 18, 40, 115);

    return MaterialApp(
      onGenerateRoute: _appRouter.onGenerateRoute,
      navigatorKey: _navigatorKey,
      theme: ThemeData(
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(brightness: Brightness.dark),
        primaryColor: _primary,
        secondaryHeaderColor: _secondary,
        primaryColorDark: _primaryDark,
        primaryColorLight: _primaryLight,
        fontFamily: 'Nunito',
        textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 22, fontWeight: FontWeight.w700, color: _black),
          headline2: TextStyle(
              fontSize: 22, fontWeight: FontWeight.w700, color: _white),
          headline3: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w700, color: _black),
          headline6: TextStyle(
              fontSize: 13, fontWeight: FontWeight.w700, color: _black),
          subtitle1: TextStyle(
              fontWeight: FontWeight.w400, color: _secondary, fontSize: 15),
          subtitle2: TextStyle(
              fontWeight: FontWeight.w400, color: _secondary, fontSize: 14),
          bodyText1: TextStyle(
              fontWeight: FontWeight.w400, color: _black, fontSize: 20),
        ),
      ),
      builder: (context, child) {
        return BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            if (state.authenticationStatus ==
                AuthenticationStatus.authenticated) {
              _navigator.pushNamedAndRemoveUntil('/home', (route) => false);
            } else if (state.authenticationStatus ==
                AuthenticationStatus.unauthenticated) {
              _navigator.pushNamedAndRemoveUntil('/login', (route) => false);
            }
          },
          child: child,
        );
      },
    );
  }
}
