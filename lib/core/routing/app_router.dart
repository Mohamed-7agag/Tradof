import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tradof/core/di/di.dart';
import 'package:tradof/core/routing/routes.dart';
import 'package:tradof/core/utils/app_constants.dart';
import 'package:tradof/features/company/bottom_nav_bar/presentation/views/bottom_nav_bar_company_view.dart';
import 'package:tradof/features/company/profile_company/presentation/logic/cubit/profile_company_cubit.dart';
import 'package:tradof/features/freelancer/bottom_nav_bar/presentation/views/bottom_nav_bar_freelancer_view.dart';

import '../../features/auth/presentation/logic/auth_cubit/auth_cubit.dart';
import '../../features/auth/presentation/logic/registeration_cubit/registeration_cubit.dart';
import '../../features/auth/presentation/views/create_account_page_view.dart';
import '../../features/auth/presentation/views/forget_password_page_view.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/verification_view.dart';
import '../../welcome_view.dart';
import '../cache/cache_helper.dart';
import '../helpers/navigation_handler.dart';
import '../utils/app_constants.dart';
import '../utils/logic/meta_data_cubit/meta_data_cubit.dart';

class AppRouter {
  static final router = GoRouter(
    navigatorKey: NavigationHandler.navigatorKey,
    initialLocation: '/welcomeView',
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
        name: Routes.bottomNavBarFreelancerViewRoute,
        path: '/bottomNavBarView',
        builder: (context, state) => BottomNavBarFreelancerView(),
      ),
      GoRoute(
        name: Routes.bottomNavBarCompanyViewRoute,
        path: '/bottomNavBarCompanyView',
        builder: (context, state) => BlocProvider(
          create: (context) => ProfileCompanyCubit(getIt())..getCompanyProfile(id: CacheHelper.getString( AppConstants.userId)),
          child: CompanyBottomNavBarView(),
        ),
      )
    ],
  );
}
