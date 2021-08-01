import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserState());

  void onLoginClicked() {
    emit(UserState.withCredentials(
        email: state.emailController.text,
        password: state.passwordController.text));
  }
}
