part of 'user_cubit.dart';

class UserState {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String? email;
  String? password;

  UserState();
  UserState.withCredentials({this.email, this.password});
}
