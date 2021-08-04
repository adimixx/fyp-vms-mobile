import 'dart:async';
import 'dart:convert';

import 'package:network_repository/network_repository.dart';
import 'package:vms/models/user.dart';

class UserRepository {
  User? _user;

  Future<User?> getUser() async {
    if (_user != null) return _user;

    final response = await NetworkRepository().getData(apiUrl: '/user');

    if (response.statusCode >= 200 && response.statusCode <= 300) {
      _user = User.fromJson(jsonDecode(response.body));
      return _user;
    }

    return null;
  }
}
