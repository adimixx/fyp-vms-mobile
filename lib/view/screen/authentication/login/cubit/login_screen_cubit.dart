import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:vms/logic/authentication/repository/authentication_repository.dart';

part 'login_screen_state.dart';

class LoginScreenCubit extends Cubit<LoginScreenState> {
  LoginScreenCubit({required this.authenticationRepository})
      : super(LoginScreenState());

  final AuthenticationRepository authenticationRepository;

  Future<void> onLogin() async {
    await authenticationRepository.login(
        email: state.emailController.text,
        password: state.passwordController.text);
  }
}
