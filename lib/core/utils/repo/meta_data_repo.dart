import '../../../features/auth/data/model/specialization_model.dart';
import '../models/country_model.dart';
import '../models/language_model.dart';

abstract class MetaDataRepo {
  Future<List<CountryModel>> getCountries();
  Future<List<LanguageModel>> getLanguages();
  Future<List<SpecializationModel>> getSpecaialization();
}
