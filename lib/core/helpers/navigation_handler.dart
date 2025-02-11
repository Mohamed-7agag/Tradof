import 'package:flutter/material.dart';
import 'package:tradof/core/helpers/extensions.dart';
import 'package:tradof/core/routing/routes.dart';
import 'package:tradof/core/utils/widgets/custom_toastification.dart';

class NavigationHandler {
  NavigationHandler._privateConstructor();

  static final NavigationHandler _instance =
      NavigationHandler._privateConstructor();

  static NavigationHandler get instance => _instance;

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  BuildContext? get context => navigatorKey.currentContext;

  void goToLoginView() {
    if (context == null) return;
    errorToast(
      context!,
      'Error',
      'Session Expired, Login Again',
    );
    context!.goNamed(Routes.loginViewRoute);
  }
}
