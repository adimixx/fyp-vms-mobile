import 'dart:convert';

import 'package:vms/data/provider/user_api.dart';
import 'package:vms/model/user.dart';

class UserRepo {
  Future<User> login(
      {required String username, required String password}) async {
    UserAPI userAPI = new UserAPI();

    final String rawUser =
        await userAPI.postUser(username: username, password: password);

    User user = User.fromJson(jsonDecode(rawUser));
    return user;
  }
}
