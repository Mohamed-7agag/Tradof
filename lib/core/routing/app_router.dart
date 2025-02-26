import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../company_features/company_bottom_nav_bar_view.dart';
import '../../company_features/company_profile/data/model/company_model.dart';
import '../../company_features/company_profile/data/model/social_media_model.dart';
import '../../company_features/company_profile/presentation/logic/company_profile_cubit/company_profile_cubit.dart';
import '../../company_features/company_profile/presentation/views/add_update_social_media_view.dart';
import '../../company_features/company_profile/presentation/views/company_add_employee_view.dart';
import '../../company_features/company_profile/presentation/views/company_employees_view.dart';
import '../../company_features/company_profile/presentation/views/company_profile_display_view.dart';
import '../../company_features/company_profile/presentation/views/update_company_profile_tables_view.dart';
import '../../company_features/company_setting/presentation/logic/company_setting_cubit/company_setting_cubit.dart';
import '../../company_features/company_setting/presentation/views/change_company_password_view.dart';
import '../../company_features/company_setting/presentation/views/update_company_profile_view.dart';
import '../../freelancer_features/freelancer_bottom_nav_bar_view.dart';
import '../../freelancer_features/freelancer_profile/data/model/freelancer_model.dart';
import '../../freelancer_features/freelancer_profile/presentation/logic/freelancer_profile_cubit/freelancer_profile_cubit.dart';
import '../../freelancer_features/freelancer_profile/presentation/views/freelancer_profile_display_view.dart';
import '../../freelancer_features/freelancer_profile/presentation/views/update_freelancer_profile_tables_view.dart';
import '../../freelancer_features/freelancer_profile/presentation/views/update_freelancer_social_media_view.dart';
import '../../freelancer_features/freelancer_setting/presentation/logic/freelancer_setting_cubit/freelancer_setting_cubit.dart';
import '../../freelancer_features/freelancer_setting/presentation/views/change_freelancer_password_view.dart';
import '../../freelancer_features/freelancer_setting/presentation/views/update_freelancer_profile_view.dart';
import '../../shared_features/auth/presentation/logic/auth_cubit/auth_cubit.dart';
import '../../shared_features/auth/presentation/logic/registeration_cubit/registeration_cubit.dart';
import '../../shared_features/auth/presentation/logic/tables_cubit/tables_cubit.dart';
import '../../shared_features/auth/presentation/views/create_account_page_view.dart';
import '../../shared_features/auth/presentation/views/forget_password_page_view.dart';
import '../../shared_features/auth/presentation/views/login_view.dart';
import '../../shared_features/offers/presentation/logic/cubit/offer_cubit.dart';
import '../../shared_features/offers/presentation/views/add_offer_view.dart';
import '../../shared_features/projects/data/models/project_model.dart';
import '../../shared_features/projects/presentation/logic/project_cubit/project_cubit.dart';
import '../../shared_features/projects/presentation/views/company_project_details_view.dart';
import '../../shared_features/projects/presentation/views/company_project_workspace_view.dart';
import '../../shared_features/projects/presentation/views/freelancer_project_details_view.dart';
import '../../shared_features/projects/presentation/views/freelancer_project_workspace_view.dart';
import '../../welcome_view.dart';
import '../cache/cache_helper.dart';
import '../di/di.dart';
import '../utils/app_constants.dart';
import 'routes.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.welcomeViewRoute:
        return MaterialPageRoute(
          builder: (_) => const WelcomeView(),
        );
      case Routes.loginViewRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(getIt()),
            child: const LoginView(),
          ),
        );
      case Routes.forgetPasswordPageViewRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(getIt()),
            child: const ForgetPasswordPageView(),
          ),
        );
      case Routes.createAccountPageViewRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => RegisterationCubit(getIt()),
            child: const CreateAccountPageView(),
          ),
        );
      case Routes.freelancerBottomNavBarViewRoute:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    FreelancerProfileCubit(getIt())..getFreelancerProfile(),
              ),
              BlocProvider(
                create: (context) => ProjectCubit(getIt()),
              ),
            ],
            child: const FreelancerBottomNavBarView(),
          ),
        );
      case Routes.companyBottomNavBarViewRoute:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => ProjectCubit(getIt()),
              ),
              BlocProvider(
                create: (context) =>
                    CompanyProfileCubit(getIt())..getCompanyProfile(),
              ),
            ],
            child: const CompanyBottomNavBarView(),
          ),
        );
      case Routes.updateCompanyProfileTablesViewRoute:
        final data = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => TablesCubit()
              ..addInitialData(
                industriesServed: data['data'].specializations,
                preferedLanguages: data['data'].preferredLanguages,
              ),
            child: UpdateCompanyProfileTablesView(
              companyModel: data['data'],
              isPreferedLanguages: data['isPreferedLanguages'],
            ),
          ),
        );
      case Routes.updateCompanyProfileViewRoute:
        final comanyModel = settings.arguments as CompanyModel;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => CompanySettingCubit(getIt()),
            child: UpdateCompanyProfileView(companyModel: comanyModel),
          ),
        );
      case Routes.changeCompanyPasswordViewRoute:
        return MaterialPageRoute(
          builder: (_) => const ChangeCompanyPasswordView(),
        );
      case Routes.addUpdateSocialMediaViewRoute:
        final socialMedia = settings.arguments as List<SocialMediaModel>;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => CompanyProfileCubit(getIt()),
            child: AddUpdateSocialMediaView(socialMedia: socialMedia),
          ),
        );
      case Routes.companyEmployeesViewRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                CompanyProfileCubit(getIt())..getCompanyEmployees(),
            child: const CompanyEmployeesView(),
          ),
        );
      case Routes.companyAddEmployeeViewRoute:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => CompanyProfileCubit(getIt()),
              ),
            ],
            child: const CompanyAddEmployeeView(),
          ),
        );
      case Routes.addOfferViewRoute:
        final id = settings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => OfferCubit(getIt()),
            child: AddOfferView(projectId: id),
          ),
        );
      case Routes.updateFreelancerSocialMediaViewRoute:
        final socialMedia = settings.arguments as List<SocialMediaModel>;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => FreelancerProfileCubit(getIt()),
            child: UpdateFreelancerSocialMediaView(socialList: socialMedia),
          ),
        );
      case Routes.changeFreelancerPasswordViewRoute:
        return MaterialPageRoute(
          builder: (_) => const ChangeFreelancerPasswordView(),
        );
      case Routes.updateFreelancerProfileViewRoute:
        final freelancerModel = settings.arguments as FreelancerModel;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => FreelancerSettingCubit(getIt()),
            child: UpdateFreelancerProfileView(
              freelancerModel: freelancerModel,
            ),
          ),
        );
      case Routes.updateFreelancerProfileTablesViewRoute:
        final data = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => TablesCubit()
              ..addInitialData(
                freelancerLanguagePairs: data['data'].languagePairs,
                specializations: data['data'].specializations,
              ),
            child: UpdateFreelancerProfileTablesView(
              freelancerModel: data['data'],
              isLanguagePair: data['isLanguagePair'],
            ),
          ),
        );
      case Routes.companyProjectDetailsViewRoute:
        final data = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ProjectCubit(getIt()),
            child: CompanyProjectDetailsView(
              companyModel: data['companyModel'],
              projectModel: data['projectModel'],
            ),
          ),
        );
      case Routes.companyProjectWorkspaceViewRoute:
        return MaterialPageRoute(
          builder: (_) => const CompanyProjectWorkspaceView(),
        );
      case Routes.freelancerProjectWorkspaceViewRoute:
        return MaterialPageRoute(
          builder: (_) => const FreelancerProjectWorkspaceView(),
        );
      case Routes.freelancerProjectDetailsViewRoute:
        final data = settings.arguments as ProjectModel;
        return MaterialPageRoute(
          builder: (_) => FreelancerProjectDetailsView(
            projectModel: data,
          ),
        );
      case Routes.freelancerProfileDisplayViewRoute:
        final freelancerId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => FreelancerProfileCubit(getIt())
              ..getFreelancerProfile(freelancerId: freelancerId),
            child: const FreelancerProfileDisplayView(),
          ),
        );
      case Routes.companyProfileDisplayViewRoute:
        final companyId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => CompanyProfileCubit(getIt())
              ..getCompanyProfile(companyId: companyId),
            child: const CompanyProfileDisplayView(),
          ),
        );
      default:
        return null;
    }
  }

  static String initialRoute() {
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
