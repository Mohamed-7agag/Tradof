import '../../features/freelancer/freelancer_profile/data/model/freelancer_langauge_pair_model.dart';
import '../utils/models/language_model.dart';
import '../utils/models/language_pair_model.dart';

/// Convert [FreelancerLangaugePairModel] to [LanguagePairModel]
List<LanguagePairModel> convertLanguagePairs(
    List<FreelancerLangaugePairModel>? freelancerLanguagePairs) {
  List<LanguagePairModel> languagePairsList = [];
  if (freelancerLanguagePairs != null) {
    LanguageModel? languageFrom, languageTo;
    for (var element in freelancerLanguagePairs) {
      languageFrom = LanguageModel(
        id: element.languageFromId,
        languageName: element.languageFromName,
        languageCode: element.languageFromCode,
        countryName: null,
        countryCode: element.countryFromCode,
      );
      languageTo = LanguageModel(
        id: element.languageToId,
        languageName: element.languageToName,
        languageCode: element.languageToCode,
        countryName: null,
        countryCode: element.countryToCode,
      );
      languagePairsList.add(LanguagePairModel(
        id: element.id,
        fromLanguage: languageFrom,
        toLanguage: languageTo,
      ));
    }
    return languagePairsList;
  }
  return [];
}
