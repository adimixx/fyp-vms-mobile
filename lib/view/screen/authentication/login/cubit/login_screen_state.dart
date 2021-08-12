part of 'login_screen_cubit.dart';

class LoginScreenState {
  const LoginScreenState(
      {required this.emailController,
      required this.passwordController,
      required this.loginFormKey,
      this.loginPending = false,
      this.snackbarMessage});

  const LoginScreenState.loginPendingChanged(
      {required this.emailController,
      required this.passwordController,
      required this.loginFormKey,
      required this.loginPending,
      this.snackbarMessage});

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> loginFormKey;
  final bool loginPending;
  final String? snackbarMessage;
}
