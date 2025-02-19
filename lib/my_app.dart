import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/di.dart';
import 'core/helpers/navigation_handler.dart';
import 'core/routing/app_router.dart';
import 'core/theming/app_colors.dart';
import 'core/utils/logic/meta_data_cubit/meta_data_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return BlocProvider(
          create: (context) => MetaDataCubit(getIt())..fetchAllMetaData(),
          child: _myMaterialApp(),
        );
      },
    );
  }

  MaterialApp _myMaterialApp() {
    return MaterialApp(
      theme: _appTheme(),
      builder: _mediaQueryWidget,
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigationHandler.navigatorKey,
      initialRoute: AppRouter.initialRoute(),
      onGenerateRoute: AppRouter.generateRoute,
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
      appBarTheme: const AppBarTheme(
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.primary,
        toolbarHeight: 65,
      ),
      pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      }),
    );
  }
}
