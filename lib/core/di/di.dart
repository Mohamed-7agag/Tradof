import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tradof/features/company/profile_company/data/repos/profile_company_repo.dart';
import 'package:tradof/features/company/profile_company/data/repos/profile_company_repo_impl.dart';

import '../../features/auth/data/repo/auth_repo.dart';
import '../../features/auth/data/repo/auth_repo_impl.dart';
import '../../features/auth/data/repo/registeration_repo.dart';
import '../../features/auth/data/repo/registeration_repo_impl.dart';
import '../../features/projects/data/repo/project_repo.dart';
import '../../features/projects/data/repo/project_repo_impl.dart';
import '../api/api_service.dart';
import '../api/dio_factory.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  // Dio & ApiServices
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(dio: dio));

  // AuthRepo
  getIt.registerFactory<AuthRepo>(() => AuthRepoImpl(apiServices: getIt()));

  // Registeration Repo
  getIt.registerFactory<RegisterationRepo>(
    () => RegisterationRepoImpl(apiServices: getIt()),
  );
  // project repo
  getIt.registerFactory<ProjectRepo>(
    () => ProjectRepoImpl(apiServices: getIt()),
  );

  // profile company repo
  getIt.registerFactory<ProfileCompanyRepo>(
    () => ProfileCompanyRepoImpl(apiServices: getIt()),
  );
}
