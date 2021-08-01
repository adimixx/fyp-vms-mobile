part of 'user_cubit.dart';

class UserState {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String? email;
  String? password;
  User? user;

  UserState();
  UserState.withCredentials({this.email, this.password});
  UserState.fromModel({this.user});
}
