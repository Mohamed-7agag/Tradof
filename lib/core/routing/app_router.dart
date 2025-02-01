import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tradof/core/di/di.dart';
import 'package:tradof/core/routing/routes.dart';
import 'package:tradof/features/company/bottom_nav_bar/presentation/logic/company_bottom_nav_bar_cubit.dart';
import 'package:tradof/features/company/profile_company/presentation/logic/company_profile_cubit/profile_company_cubit.dart';
import 'package:tradof/features/freelancer/bottom_nav_bar/presentation/views/bottom_nav_bar_freelancer_view.dart';

import '../../features/auth/presentation/logic/auth_cubit/auth_cubit.dart';
import '../../features/auth/presentation/logic/registeration_cubit/registeration_cubit.dart';
import '../../features/auth/presentation/views/create_account_page_view.dart';
import '../../features/auth/presentation/views/forget_password_page_view.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/verification_view.dart';
import '../../features/company/bottom_nav_bar/presentation/views/company_bottom_nav_bar_view.dart';
import '../../welcome_view.dart';
import '../cache/cache_helper.dart';
import '../helpers/navigation_handler.dart';
import '../utils/app_constants.dart';
import '../utils/logic/meta_data_cubit/meta_data_cubit.dart';

class AppRouter {
  static final router = GoRouter(
    navigatorKey: NavigationHandler.navigatorKey,
    initialLocation: '/loginView',
    redirect: (context, state) {
      if (CacheHelper.getBool(AppConstants.firstTime) == true) {
        if (CacheHelper.getString(AppConstants.role) == 'Freelancer') {
          //return Routes.freelancerBottomNavBarViewRoute;
          return Routes.companyBottomNavBarViewRoute;
        } else if (CacheHelper.getString(AppConstants.role) == 'CompanyAdmin') {
          return Routes.companyBottomNavBarViewRoute;
        } else {
          return Routes.loginViewRoute;
        }
      }
      return Routes.welcomeViewRoute;
    },
    routes: [
      GoRoute(
        name: Routes.welcomeViewRoute,
        path: '/welcomeView',
        builder: (context, state) => WelcomeView(),
      ),
      GoRoute(
        name: Routes.loginViewRoute,
        path: '/loginView',
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(getIt()),
          child: LoginView(),
        ),
      ),
      GoRoute(
        name: Routes.forgetPasswordPageViewRoute,
        path: '/forgetPasswordPageView',
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(getIt()),
          child: ForgetPasswordPageView(),
        ),
      ),
      GoRoute(
        name: Routes.createAccountPageViewRoute,
        path: '/createAccountPageView',
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => RegisterationCubit(getIt())),
            BlocProvider(
              create: (context) => MetaDataCubit(getIt())..fetchAllMetaData(),
            ),
          ],
          child: CreateAccountPageView(),
        ),
      ),
      GoRoute(
        name: Routes.verificationViewRoute,
        path: '/verificationView',
        builder: (context, state) => VerificationView(),
      ),
      GoRoute(
        name: Routes.freelancerBottomNavBarViewRoute,
        path: '/freelancerBottomNavBarView',
        builder: (context, state) => BottomNavBarFreelancerView(),
      ),
      GoRoute(
        name: Routes.companyBottomNavBarViewRoute,
        path: '/companyBottomNavBarView',
        builder: (context, state) {
          final index = state.extra as int?;
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => CompanyBottomNavBarCubit(),
              ),
              BlocProvider(
                create: (context) => MetaDataCubit(getIt()),
              ),
              BlocProvider(
                create: (context) =>
                    CompanyProfileCubit(getIt())..getCompanyProfile(),
              ),
            ],
            child: CompanyBottomNavBarView(initialIndex: index ?? 4),
          );
        },
      )
    ],
  );
}
