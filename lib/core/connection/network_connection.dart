import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkInfoProvider extends ChangeNotifier {
  bool _isConnected = true;

  bool get isConnected => _isConnected;

  NetworkInfoProvider() {
    InternetConnectionChecker.instance.onStatusChange.listen((status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          _isConnected = true;
          break;
        case InternetConnectionStatus.disconnected:
          _isConnected = false;
          break;
        case InternetConnectionStatus.slow:
          _isConnected = false;
          break;
      }
      notifyListeners();
    });
  }
}
