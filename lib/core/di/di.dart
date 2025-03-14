import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/repo/auth_repo.dart';
import '../../features/auth/data/repo/auth_repo_impl.dart';
import '../../features/offers/data/repos/offer_repo.dart';
import '../../features/offers/data/repos/offer_repo_impl.dart';
import '../../features/profile/company_profile/data/repos/company_profile_repo.dart';
import '../../features/profile/company_profile/data/repos/company_profile_repo_impl.dart';
import '../../features/profile/freelancer_profile/data/repo/freelancer_profile_repo.dart';
import '../../features/profile/freelancer_profile/data/repo/freelancer_profile_repo_impl.dart';
import '../../features/projects/data/repo/project_repo.dart';
import '../../features/projects/data/repo/project_repo_impl.dart';
import '../../features/settings/company_setting/data/repo/company_setting_repo.dart';
import '../../features/settings/company_setting/data/repo/company_setting_repo_impl.dart';
import '../../features/settings/freelancer_setting/data/repo/freelancer_setting_repo.dart';
import '../../features/settings/freelancer_setting/data/repo/freelancer_setting_repo_impl.dart';
import '../api/api_service.dart';
import '../api/dio_factory.dart';
import '../utils/repo/meta_data_repo.dart';
import '../utils/repo/meta_data_repo_impl.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  // Dio & ApiServices
  final Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(dio: dio));

  // Non-authenticated Dio instance with a different base URL
  // final Dio nonAuthenticatedDio = NonAuthenticatedDioFactory.getDio();
  // getIt.registerLazySingleton<ApiServices>(
  //     () => ApiServices(dio: nonAuthenticatedDio),
  //     instanceName: 'NonAuthenticatedApiServices');

  // AuthRepo
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(apiServices: getIt()),
  );
  // project repo
  getIt.registerLazySingleton<ProjectRepo>(
    () => ProjectRepoImpl(apiServices: getIt()),
  );
  // MetaData Repo
  getIt.registerLazySingleton<MetaDataRepo>(
    () => MetaDataRepoImpl(apiServices: getIt()),
  );

  // company profile repo
  getIt.registerLazySingleton<CompanyProfileRepo>(
    () => CompanyProfileRepoImpl(apiServices: getIt()),
  );

  // company setting repo
  getIt.registerLazySingleton<CompanySettingRepo>(
    () => CompanySettingRepoImpl(apiServices: getIt()),
  );

  // offer repo
  getIt.registerLazySingleton<OfferRepo>(
    () => OfferRepoImpl(apiServices: getIt()),
  );

  // freelancer repo
  getIt.registerLazySingleton<FreelancerProfileRepo>(
    () => FreelancerProfileRepoImpl(apiServices: getIt()),
  );

  // freelancer setting repo
  getIt.registerLazySingleton<FreelancerSettingRepo>(
    () => FreelancerSettingRepoImpl(apiServices: getIt()),
  );
}

// getIt<ApiServices>(instanceName: 'NonAuthenticatedApiServices')