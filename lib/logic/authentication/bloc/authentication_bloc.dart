import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vms/logic/authentication/repository/authentication_repository.dart';
import 'package:vms/logic/authentication/repository/user_repository.dart';
import 'package:vms/models/user.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(
      {required this.authenticationRepository, required this.userRepository})
      : super(const AuthenticationState.unknown()) {
    _authenticationStatusSubscription = authenticationRepository.status.listen(
      (event) => add(AuthenticationStatusChanged(event)),
    );
  }

  final AuthenticationRepository authenticationRepository;
  final UserRepository userRepository;
  late StreamSubscription<AuthenticationStatus>
      _authenticationStatusSubscription;

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AuthenticationStatusChanged) {
      yield await _mapAuthenticationStatusChangedToState(event);
    } else if (event is AuthenticationLogoutRequested) {
      authenticationRepository.logout();
    }
  }

  @override
  Future<void> close() {
    _authenticationStatusSubscription.cancel();
    authenticationRepository.dispose();
    return super.close();
  }

  Future<AuthenticationState> _mapAuthenticationStatusChangedToState(
      AuthenticationStatusChanged event) async {
    switch (event.authenticationStatus) {
      case AuthenticationStatus.unauthenticated:
        return const AuthenticationState.unauthenticated();
      case AuthenticationStatus.authenticated:
        final user = await _tryGetUser();
        return user != null
            ? AuthenticationState.authenticated(user)
            : const AuthenticationState.unauthenticated();
      default:
        return const AuthenticationState.unknown();
    }
  }

  Future<User?> _tryGetUser() async {
    try {
      final user = await userRepository.getUser();
      return user;
    } on Exception {
      authenticationRepository.logout();
      return null;
    }
  }
}
