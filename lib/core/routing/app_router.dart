import 'package:flutter/material.dart';
import 'package:tradof/core/routing/routes.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginViewRoute:
      //return MaterialPageRoute(builder: (_) => const SplashView());
      default:
        return null;
    }
  }
}
