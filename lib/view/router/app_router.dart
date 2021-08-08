import 'package:flutter/material.dart';
import 'package:vms/view/screen/authentication/login/login_screen.dart';
import 'package:vms/view/screen/home/home_screen.dart';
import 'package:vms/view/screen/splash/splash_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/splash':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      default:
        return MaterialPageRoute(builder: (_) => SplashScreen());
    }
  }
}
