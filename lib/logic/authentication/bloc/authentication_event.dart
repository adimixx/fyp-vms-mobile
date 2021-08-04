part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationStatusChanged extends AuthenticationEvent {
  const AuthenticationStatusChanged(this.authenticationStatus);

  final AuthenticationStatus authenticationStatus;

  @override
  List<Object> get props => [authenticationStatus];
}

class AuthenticationLogoutRequested extends AuthenticationEvent {}
