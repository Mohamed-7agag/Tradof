import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tradof/features/freelancer/freelancer_setting/data/repo/freelancer_setting_repo_impl.dart';
import 'package:tradof/features/offers/data/repos/offer_repo.dart';
import 'package:tradof/features/offers/data/repos/offer_repo_impl.dart';

import '../../features/auth/data/repo/auth_repo.dart';
import '../../features/auth/data/repo/auth_repo_impl.dart';
import '../../features/auth/data/repo/registeration_repo.dart';
import '../../features/auth/data/repo/registeration_repo_impl.dart';
import '../../features/company/company_profile/data/repos/company_profile_repo.dart';
import '../../features/company/company_profile/data/repos/company_profile_repo_impl.dart';
import '../../features/company/company_setting/data/repo/company_setting_repo.dart';
import '../../features/company/company_setting/data/repo/company_setting_repo_impl.dart';
import '../../features/freelancer/freelancer_profile/data/repo/freelancer_profile_repo.dart';
import '../../features/freelancer/freelancer_profile/data/repo/freelancer_profile_repo_impl.dart';
import '../../features/freelancer/freelancer_setting/data/repo/freelancer_setting_repo.dart';
import '../../features/projects/data/repo/project_repo.dart';
import '../../features/projects/data/repo/project_repo_impl.dart';
import '../api/api_service.dart';
import '../api/dio_factory.dart';
import '../utils/repo/meta_data_repo.dart';
import '../utils/repo/meta_data_repo_impl.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  // Dio & ApiServices
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(dio: dio));

  // AuthRepo
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(apiServices: getIt()),
  );

  // Registeration Repo
  getIt.registerLazySingleton<RegisterationRepo>(
    () => RegisterationRepoImpl(apiServices: getIt()),
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
