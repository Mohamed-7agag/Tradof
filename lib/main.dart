import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tradof/core/di/di.dart';

import 'core/cache/cache_helper.dart';
import 'core/helpers/cubit_observer.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  Bloc.observer = MyBlocObserver();
  await Future.wait([
    CacheHelper.init(),
    ScreenUtil.ensureScreenSize(),
    _systemChromeConfig(),
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData.light().copyWith(
            textTheme: GoogleFonts.tajawalTextTheme(
              ThemeData.light().textTheme,
            ),
          ),
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context)
                  .copyWith(textScaler: const TextScaler.linear(1.0)),
              child: child!,
            );
          },
          onGenerateRoute: AppRouter.generateRoute,
          initialRoute: Routes.loginViewRoute,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}

// to make sure that the device orientation is set to portrait
Future<void> _systemChromeConfig() {
  return SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}
