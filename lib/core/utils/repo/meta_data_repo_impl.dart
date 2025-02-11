import 'package:dartz/dartz.dart';

import '../models/country_model.dart';
import '../models/language_model.dart';
import '../../../features/auth/data/model/specialization_model.dart';
import '../../api/api_service.dart';
import '../../api/end_points.dart';
import '../../errors/failure.dart';
import '../../helpers/handle_request_method.dart';
import 'meta_data_repo.dart';

class MetaDataRepoImpl implements MetaDataRepo {
  final ApiServices _apiServices;

  MetaDataRepoImpl({required ApiServices apiServices})
      : _apiServices = apiServices;

  @override
  Future<Either<Failure, List<CountryModel>>> getCountries() {
    return handleRequest(() async {
      final response = await _apiServices.get(
        EndPoint.getCountries,
      );
      List<CountryModel> countries = List<CountryModel>.from(
        response.map((country) => CountryModel.fromJson(country)),
      );
      return countries;
    });
  }

  @override
  Future<Either<Failure, List<LanguageModel>>> getLanguages() {
    return handleRequest(() async {
      final response = await _apiServices.get(
        EndPoint.getLanguages,
      );
      List<LanguageModel> languages = List<LanguageModel>.from(
        response.map((language) => LanguageModel.fromJson(language)),
      );
      return languages;
    });
  }

  @override
  Future<Either<Failure, List<SpecializationModel>>> getSpecaialization() {
    return handleRequest(() async {
      final response = await _apiServices.get(
        EndPoint.getSpecializations,
      );
      List<SpecializationModel> specializations =
          List<SpecializationModel>.from(response.map(
        (specialization) => SpecializationModel.fromJson(specialization),
      ));
      return specializations;
    });
  }
}
