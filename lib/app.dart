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
    return MaterialApp(
      onGenerateRoute: _appRouter.onGenerateRoute,
      navigatorKey: _navigatorKey,
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
