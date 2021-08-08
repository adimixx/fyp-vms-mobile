import 'dart:async';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:network_repository/network_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    if (localStorage.getString('token') == null) {
      yield AuthenticationStatus.unauthenticated;
    }

    yield AuthenticationStatus.authenticated;

    yield* _controller.stream;
  }

  Future<void> login({required String email, required String password}) async {
    DeviceInfoPlugin device = DeviceInfoPlugin();
    String deviceInfo = 'Unknown';
    if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await device.iosInfo;
      deviceInfo = iosInfo.utsname.machine ?? iosInfo.model ?? 'Apple';
    } else if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await device.androidInfo;
      deviceInfo = androidInfo.model ?? androidInfo.product ?? 'Android';
    }

    final rawToken = await NetworkRepository().postData(
        apiUrl: '/token',
        data: {
          'email': email,
          'password': password,
          'device_name': deviceInfo
        });

    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.setString('token', rawToken.body);

    _controller.add(AuthenticationStatus.authenticated);
  }

  Future<void> logout() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.remove('token');

    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}
