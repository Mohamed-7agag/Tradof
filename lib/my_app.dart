import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tradof/core/helpers/navigation_handler.dart';
import 'package:tradof/core/routing/app_router.dart';
import 'package:tradof/core/theming/app_colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          theme: _appTheme(),
          builder: (context, child) {
            return _mediaQueryWidget(context, child);
          },
          debugShowCheckedModeBanner: false,
          navigatorKey: NavigationHandler.navigatorKey,
          onGenerateRoute: AppRouter.generateRoute,
          initialRoute: AppRouter.initialRoute(),
        );
      },
    );
  }

  MediaQuery _mediaQueryWidget(BuildContext context, Widget? child) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaler: const TextScaler.linear(1.0),
      ),
      child: child!,
    );
  }

  ThemeData _appTheme() {
    return ThemeData.light().copyWith(
      scaffoldBackgroundColor: AppColors.background,
      primaryColor: AppColors.primary,
      appBarTheme: AppBarTheme(
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.primary,
        toolbarHeight: 65,
      ),
      pageTransitionsTheme: PageTransitionsTheme(builders: {
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: FadeForwardsPageTransitionsBuilder(),
      }),
    );
  }
}
