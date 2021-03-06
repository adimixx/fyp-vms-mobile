import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class NetworkRepository {
  final String domain = 'https://vms.psm.adimixx.com/';
  late final String _url;

  NetworkRepository() {
    this._url = domain + 'api';
  }
  //if you are using android studio emulator, change localhost to 10.0.2.2
  var token;

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('token');
  }

  postData({data, required apiUrl}) async {
    var fullUrl = _url + apiUrl;
    await _getToken();
    return await http.post(Uri.parse(fullUrl),
        body: jsonEncode(data), headers: _setHeaders());
  }

  getData({required apiUrl}) async {
    var fullUrl = _url + apiUrl;
    await _getToken();
    return await http.get(Uri.parse(fullUrl), headers: _setHeaders());
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
}
