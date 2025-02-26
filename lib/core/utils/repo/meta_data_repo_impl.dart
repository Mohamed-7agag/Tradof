import '../../../shared_features/auth/data/model/specialization_model.dart';
import '../../api/api_service.dart';
import '../../api/end_points.dart';
import '../models/country_model.dart';
import '../models/language_model.dart';
import 'meta_data_repo.dart';

class MetaDataRepoImpl implements MetaDataRepo {

  MetaDataRepoImpl({required ApiServices apiServices})
      : _apiServices = apiServices;
  final ApiServices _apiServices;

  @override
  Future<List<CountryModel>> getCountries() async {
    final response = await _apiServices.get(
      EndPoint.getCountries,
    );
    final List<CountryModel> countries = List<CountryModel>.from(
      response.map((country) => CountryModel.fromJson(country)),
    );
    return countries;
  }

  @override
  Future<List<LanguageModel>> getLanguages() async {
    final response = await _apiServices.get(
      EndPoint.getLanguages,
    );
    final List<LanguageModel> languages = List<LanguageModel>.from(
      response.map((language) => LanguageModel.fromJson(language)),
    );
    return languages;
  }

  @override
  Future<List<SpecializationModel>> getSpecaialization() async {
    final response = await _apiServices.get(
      EndPoint.getSpecializations,
    );
    final List<SpecializationModel> specializations =
        List<SpecializationModel>.from(response.map(
      (specialization) => SpecializationModel.fromJson(specialization),
    ));
    return specializations;
  }
}
