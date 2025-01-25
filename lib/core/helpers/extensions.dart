import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension NavigationExtension on BuildContext {
  // Push a new route onto the stack
  void pushNamed(String routeName, {Object? extra}) {
    GoRouter.of(this).push(routeName, extra: extra);
  }

  // Replace the current route with a new route
  void pushReplacementNamed(String routeName, {Object? extra}) {
    GoRouter.of(this).pushReplacement(routeName, extra: extra);
  }

  // Push a new route and remove all previous routes until the predicate is met
  // void pushNamedAndRemoveUntil(String routeName, {Object? extra, required RoutePredicate predicate}) {
  //   GoRouter.of(this).push(routeName, extra: extra);
  //   // GoRouter does not have a direct equivalent for `pushNamedAndRemoveUntil`,
  //   // so we manually pop routes until the predicate is satisfied.
  //   while (predicate(GoRouter.of(this).routeInformationProvider.value.uri)) {
  //     GoRouter.of(this).pop();
  //   }
  // }

  // Pop the current route
  void pop() {
    GoRouter.of(this).pop();
  }

  // Go to a new route (replaces the entire stack)
  void goNamed(String routeName, {Object? extra}) {
    GoRouter.of(this).go(routeName, extra: extra);
  }
}

extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this == "";
}

extension ListExtension<T> on List<T>? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}
