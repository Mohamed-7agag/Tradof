import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:tradof/core/di/di.dart';
import 'package:tradof/my_app.dart';

import 'core/cache/cache_helper.dart';
import 'core/helpers/cubit_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting('en_US', null);
  setupGetIt();
//  Bloc.observer = MyBlocObserver();
  await Future.wait([
    CacheHelper.init(),
    ScreenUtil.ensureScreenSize(),
    _systemChromeConfig(),
  ]);

  runApp(const MyApp());

  // runApp(
  //   DevicePreview(
  //     enabled: false,
  //     builder: (context) => const MyApp(),
  //   ),
  // );
}

// to make sure that the device orientation is set to portrait
Future<void> _systemChromeConfig() {
  return SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}
