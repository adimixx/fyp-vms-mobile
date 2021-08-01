import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:vms/data/repo/user_repo.dart';
import 'package:vms/model/user.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserState());

  Future<void> onLoginClicked() async {
    User user = await UserRepo().login(
        username: state.emailController.text,
        password: state.passwordController.text);

    emit(UserState.fromModel(user: user));
  }
}
