import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
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
  getIt.registerFactory<AuthRepo>(
    () => AuthRepoImpl(apiServices: getIt()),
  );

  // Registeration Repo
  getIt.registerFactory<RegisterationRepo>(
    () => RegisterationRepoImpl(apiServices: getIt()),
  );
  // project repo
  getIt.registerFactory<ProjectRepo>(
    () => ProjectRepoImpl(apiServices: getIt()),
  );
  // MetaData Repo
  getIt.registerFactory<MetaDataRepo>(
    () => MetaDataRepoImpl(apiServices: getIt()),
  );

  // profile company repo
  getIt.registerFactory<CompanyProfileRepo>(
    () => CompanyProfileRepoImpl(apiServices: getIt()),
  );

  // company setting repo
  getIt.registerFactory<CompanySettingRepo>(
    () => CompanySettingRepoImpl(apiServices: getIt()),
  );

  // offer repo
  getIt.registerFactory<OfferRepo>(
    () => OfferRepoImpl(apiServices: getIt()),
  );

  // freelancer repo
  getIt.registerFactory<FreelancerProfileRepo>(
    () => FreelancerProfileRepoImpl(apiServices: getIt()),
  );
}
