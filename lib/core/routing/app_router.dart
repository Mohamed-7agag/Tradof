import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tradof/core/di/di.dart';
import 'package:tradof/core/routing/routes.dart';
import 'package:tradof/features/auth/presentation/logic/tables_cubit/tables_cubit.dart';
import 'package:tradof/features/company/bottom_nav_bar/presentation/logic/company_bottom_nav_bar_cubit.dart';
import 'package:tradof/features/company/bottom_nav_bar/presentation/views/company_bottom_nav_bar_view.dart';
import 'package:tradof/features/company/company_setting/presentation/views/company_setting_view.dart';
import 'package:tradof/features/company/profile_company/presentation/views/edit_profile_company_view.dart';
import 'package:tradof/features/company/profile_company/presentation/views/profile_company_view.dart';
import 'package:tradof/features/company/profile_company/presentation/views/update_company_profile_tables_view.dart';
import 'package:tradof/features/freelancer/bottom_nav_bar/presentation/views/bottom_nav_bar_freelancer_view.dart';
import 'package:tradof/features/freelancer/dashbord/presentation/views/freelance_dashbord_view.dart';
import 'package:tradof/features/projects/presentation/logic/project_cubit/project_cubit.dart';
import 'package:tradof/features/projects/presentation/views/create_project_view.dart';

import '../../features/auth/presentation/logic/auth_cubit/auth_cubit.dart';
import '../../features/auth/presentation/logic/registeration_cubit/registeration_cubit.dart';
import '../../features/auth/presentation/views/create_account_page_view.dart';
import '../../features/auth/presentation/views/forget_password_page_view.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/verification_view.dart';

import '../../features/company/profile_company/data/model/company_model.dart';
import '../../welcome_view.dart';
import '../utils/logic/meta_data_cubit/meta_data_cubit.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _shellNavigatorKey =
      GlobalKey<NavigatorState>();

  static final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/companyBottomNavBarView',
    // redirect: (context, state) {
    //   if (CacheHelper.getBool(AppConstants.firstTime) == true) {
    //     if (CacheHelper.getString(AppConstants.role) == 'Freelancer') {
    //       return '/freelancerBottomNavBarView';
    //     } else if (CacheHelper.getString(AppConstants.role) == 'CompanyAdmin') {
    //       return '/companyBottomNavBarView';
    //     } else {
    //       return Routes.loginViewRoute;
    //     }
    //   }
    //   return Routes.welcomeViewRoute;
    // },
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
        redirect: (context, state) => '/dashboard',
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return BlocProvider(
            create: (context) => CompanyBottomNavBarCubit(),
            child: CompanyBottomNavBarView(
              navigationShell: navigationShell,
              key: state.pageKey,
            ),
          );
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellNavigatorKey,
            routes: [
              GoRoute(
                path: '/dashboard',
                pageBuilder: (context, state) => NoTransitionPage(
                  child: FreelanceDashbordView(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/create-project',
                pageBuilder: (context, state) => NoTransitionPage(
                  child: MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (context) => ProjectCubit(getIt()),
                      ),
                      BlocProvider(
                        create: (context) => MetaDataCubit(getIt())..getLanguages(),
                      ),
                    ],
                    child: CreateProjectView(),
                  ),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                pageBuilder: (context, state) => NoTransitionPage(
                  child: ProfileCompanyView(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/wallet',
                pageBuilder: (context, state) => NoTransitionPage(
                  child:
                      FreelanceDashbordView(), // Replace with actual wallet view
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/settings',
                pageBuilder: (context, state) => NoTransitionPage(
                  child: CompanySettingView(),
                ),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        name: Routes.updateCompanyProfileTablesViewRoute,
        path: '/updateCompanyProfileTablesView',
        builder: (context, state) {
          final companyModel = state.extra as CompanyModel;
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => MetaDataCubit(getIt()),
              ),
              BlocProvider(
                create: (context) => TablesCubit()
                  ..addInitialData(
                    industriesServed: companyModel.specializations,
                    preferedLanguages: companyModel.preferredLanguages,
                  ),
              ),
            ],
            child: UpdateCompanyProfileTablesView(companyModel: companyModel),
          );
        },
      ),
      GoRoute(
        name: Routes.editProfileCompanyViewRoute,
        path: '/editProfileCompanyView',
        builder: (context, state) {
          return EditProfileCompanyView();
        },
      ),
    ],
  );
}
