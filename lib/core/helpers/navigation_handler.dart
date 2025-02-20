import 'dart:async';

import 'package:flutter/material.dart';

import '../routing/routes.dart';
import '../utils/widgets/custom_toastification.dart';
import 'extensions.dart';

class NavigationHandler {

  NavigationHandler() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (context != null) {
        _contextController.add(context!);
      }
    });
  }
  NavigationHandler._privateConstructor();

  static final NavigationHandler _instance =
      NavigationHandler._privateConstructor();

  static NavigationHandler get instance => _instance;

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  final StreamController<BuildContext> _contextController =
      StreamController<BuildContext>.broadcast();

  BuildContext? get context => navigatorKey.currentContext;

  void goToLoginView() {
    if (context != null) {
      _navigateToLogin();
    } else {
      _contextController.stream.first.then((context) {
        _navigateToLogin();
      }).catchError((error) {
        debugPrint('Failed to get context: $error');
      });
    }
  }

  void _navigateToLogin() {
    errorToast(
      context!,
      'Error',
      'Session Expired, Login Again',
    );
    context?.pushNamedAndRemoveUntil(
      Routes.loginViewRoute,
      predicate: (route) => false,
    );
  }
}
