import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:vms/logic/authentication/repository/authentication_repository.dart';

part 'login_screen_state.dart';

class LoginScreenCubit extends Cubit<LoginScreenState> {
  final AuthenticationRepository authenticationRepository;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> loginFormKey;

  LoginScreenCubit(
      {required this.authenticationRepository,
      required this.emailController,
      required this.passwordController,
      required this.loginFormKey})
      : super(LoginScreenState(
            emailController: emailController,
            passwordController: passwordController,
            loginFormKey: loginFormKey));

  Future<void> onLogin() async {
    if (state.loginFormKey.currentState!.validate()) {
      emit(LoginScreenState.loginPendingChanged(
          emailController: emailController,
          passwordController: passwordController,
          loginFormKey: loginFormKey,
          loginPending: true));

      await authenticationRepository
          .login(
              email: state.emailController.text,
              password: state.passwordController.text)
          .onError(
        (error, stackTrace) {
          emit(
            LoginScreenState.loginPendingChanged(
                emailController: emailController,
                passwordController: passwordController,
                loginFormKey: loginFormKey,
                loginPending: false,
                snackbarMessage:
                    "Invalid Email or Password. Please check your input"),
          );
        },
      );
    }
  }

  String? emailInputValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter Email Address';
    }

    return null;
  }

  String? passwordInputValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter Password';
    }

    return null;
  }
}
