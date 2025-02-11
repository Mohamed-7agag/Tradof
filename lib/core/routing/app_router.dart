import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tradof/core/di/di.dart';
import 'package:tradof/core/routing/routes.dart';

import '../../features/auth/presentation/logic/auth_cubit/auth_cubit.dart';
import '../../features/auth/presentation/logic/registeration_cubit/registeration_cubit.dart';
import '../../features/auth/presentation/logic/tables_cubit/tables_cubit.dart';
import '../../features/auth/presentation/views/create_account_page_view.dart';
import '../../features/auth/presentation/views/forget_password_page_view.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/verification_view.dart';
import '../../features/company/company_bottom_nav_bar_view.dart';
import '../../features/company/company_profile/data/model/company_model.dart';
import '../../features/company/company_profile/data/model/social_media_model.dart';
import '../../features/company/company_profile/presentation/logic/company_profile_cubit/company_profile_cubit.dart';
import '../../features/company/company_profile/presentation/views/add_update_social_media_view.dart';
import '../../features/company/company_profile/presentation/views/company_add_employee_view.dart';
import '../../features/company/company_profile/presentation/views/company_employees_view.dart';
import '../../features/company/company_profile/presentation/views/update_company_profile_tables_view.dart';
import '../../features/company/company_setting/presentation/logic/company_setting_cubit/company_setting_cubit.dart';
import '../../features/company/company_setting/presentation/views/change_company_password_view.dart';
import '../../features/company/company_setting/presentation/views/update_company_profile_view.dart';
import '../../features/freelancer/freelancer_bottom_nav_bar_view.dart';
import '../../welcome_view.dart';
import '../cache/cache_helper.dart';
import '../utils/app_constants.dart';
import '../utils/logic/meta_data_cubit/meta_data_cubit.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();

  static final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: _initLocation(),
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
        builder: (context, state) => FreelancerBottomNavBarView(),
      ),
      GoRoute(
        name: Routes.companyBottomNavBarViewRoute,
        path: '/companyBottomNavBarView',
        builder: (context, state) => BlocProvider(
          create: (context) =>
              CompanyProfileCubit(getIt())..getCompanyProfile(),
          child: CompanyBottomNavBarView(),
        ),
      ),
      GoRoute(
        name: Routes.updateCompanyProfileTablesViewRoute,
        path: '/updateCompanyProfileTablesView',
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => MetaDataCubit(getIt()),
              ),
              BlocProvider(
                create: (context) => TablesCubit()
                  ..addInitialData(
                    industriesServed: data['data'].specializations,
                    preferedLanguages: data['data'].preferredLanguages,
                  ),
              ),
            ],
            child: UpdateCompanyProfileTablesView(
              companyModel: data['data'],
              isPreferedLanguages: data['isPreferedLanguages'],
            ),
          );
        },
      ),
      GoRoute(
        name: Routes.updateCompanyProfileViewRoute,
        path: '/updateCompanyProfileView',
        builder: (context, state) {
          final comanyModel = state.extra as CompanyModel;
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => CompanySettingCubit(getIt()),
              ),
            ],
            child: UpdateCompanyProfileView(companyModel: comanyModel),
          );
        },
      ),
      GoRoute(
        name: Routes.changeCompanyPasswordViewRoute,
        path: '/changeCompanyPasswordView',
        builder: (context, state) {
          return ChangeCompanyPasswordView();
        },
      ),
      GoRoute(
        name: Routes.addUpdateSocialMediaViewRoute,
        path: '/addUpdateSocialMediaView',
        builder: (context, state) {
          final socialMedia = state.extra as List<SocialMediaModel>;
          return BlocProvider(
            create: (context) => CompanyProfileCubit(getIt()),
            child: AddUpdateSocialMediaView(socialMedia: socialMedia),
          );
        },
      ),
      GoRoute(
        name: Routes.companyEmployeesViewRoute,
        path: '/companyEmployeesView',
        builder: (context, state) {
          return BlocProvider(
            create: (context) =>
                CompanyProfileCubit(getIt())..getCompanyEmployees(),
            child: CompanyEmployeesView(),
          );
        },
      ),
      GoRoute(
        name: Routes.companyAddEmployeeViewRoute,
        path: '/companyAddEmployeeView',
        builder: (context, state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => CompanyProfileCubit(getIt()),
              ),
              BlocProvider(
                create: (context) => MetaDataCubit(getIt())..getCountries(),
              ),
            ],
            child: CompanyAddEmployeeView(),
          );
        },
      ),
    ],
  );

  static String _initLocation() {
    if (CacheHelper.getBool(AppConstants.firstTime) == true) {
      if (CacheHelper.getString(AppConstants.role) == 'Freelancer') {
        return Routes.freelancerBottomNavBarViewRoute;
      } else if (CacheHelper.getString(AppConstants.role) == 'CompanyAdmin') {
        return Routes.companyBottomNavBarViewRoute;
      } else {
        return Routes.loginViewRoute;
      }
    }
    return Routes.welcomeViewRoute;
  }
}
