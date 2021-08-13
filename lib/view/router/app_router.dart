import 'package:flutter/material.dart';
import 'package:vms/view/screen/authentication/login/login_screen.dart';
import 'package:vms/view/screen/complaint/create/complaint_create_screen.dart';
import 'package:vms/view/screen/complaint/show/complaint_show_screen.dart';
import 'package:vms/view/screen/home/home_screen.dart';
import 'package:vms/view/screen/scan_qr/qr_detected_display.dart';
import 'package:vms/view/screen/scan_qr/scan_qr_display.dart';
import 'package:vms/view/screen/splash/splash_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/home':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/qr':
        return MaterialPageRoute(builder: (_) => ScanQRDisplay());
      case '/qr/detected':
        return MaterialPageRoute(
          builder: (_) =>
              QRDetectedDisplay(parameter: routeSettings.arguments as String),
        );
      case '/complaint/show':
        return MaterialPageRoute(
          builder: (_ctx) => ComplaintShowScreen(
              args: routeSettings.arguments as ComplaintShowScreenArgs),
        );
      case '/complaint/create':
        return MaterialPageRoute(
          builder: (_ctx) => ComplaintCreateScreen(
              args: routeSettings.arguments as ComplaintCreateScreenArgs),
        );
      default:
        return MaterialPageRoute(builder: (_) => SplashScreen());
    }
  }
}
