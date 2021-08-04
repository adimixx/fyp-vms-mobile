part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState._(
      {this.authenticationStatus = AuthenticationStatus.unknown,
      this.user = User.empty});

  const AuthenticationState.unknown() : this._();

  const AuthenticationState.authenticated(User user)
      : this._(
            authenticationStatus: AuthenticationStatus.authenticated,
            user: user);

  const AuthenticationState.unauthenticated()
      : this._(authenticationStatus: AuthenticationStatus.unauthenticated);

  final AuthenticationStatus authenticationStatus;
  final User? user;

  @override
  List<Object> get props {
    List<Object> rtn = [authenticationStatus];
    if (user != null) rtn.add(user!);
    return rtn;
  }
}
