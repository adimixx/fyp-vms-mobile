import 'dart:convert';

import 'package:http/http.dart' as http;

class UserAPI {
  Future<String> postUser(
      {required String username, required String password}) async {
    final response = await http.post(
      Uri.parse('http://vms.psm.test/api/user'),
      body: jsonEncode(
          <String, String>{'username': username, 'password': password}),
    );

    final String rawUser = response.body;
    return rawUser;
  }
}
