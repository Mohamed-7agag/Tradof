import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        return MaterialApp.router(
          routerConfig: AppRouter.router,
          
          theme: ThemeData.light().copyWith(
            scaffoldBackgroundColor: AppColors.background,
            primaryColor: AppColors.primary,
          ),
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context)
                  .copyWith(textScaler: const TextScaler.linear(1.0)),
              child: child!,
            );
          },
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
