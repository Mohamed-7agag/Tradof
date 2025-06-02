import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'core/cache/cache_helper.dart';
import 'core/di/di.dart';
import 'core/helpers/cubit_observer.dart';
import 'core/utils/app_constants.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting('en_US');
  setupGetIt();
//  Bloc.observer = MyBlocObserver();
  await Future.wait([
    CacheHelper.init(),
    ScreenUtil.ensureScreenSize(),
    _systemChromeConfig(),
  ]);
  AppConstants.kUserId =
      await CacheHelper.getSecuredString(AppConstants.userId);
  runApp(const MyApp());

  // runApp(
  //   DevicePreview(
  //     builder: (context) => const MyApp(),
  //   ),
  // );
}

// to make sure that the device orientation is set to portrait
Future<void> _systemChromeConfig() {
  return SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}
