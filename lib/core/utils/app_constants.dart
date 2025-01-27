import 'package:tradof/features/auth/data/model/language_model.dart';

abstract class AppConstants {
  static const String userToken = "userToken";
}

const List<String> availableSpecializationsAndServed = [
  "Legal Translation",
  "Medical Translation",
  "Marketing Translation",
  "Technical Translation",
  "Financial Translation",
];
const List<LanguageModel> availableLanguage = [
  LanguageModel(languageName: 'English-French', tag: 'En-Fr'),
  LanguageModel(languageName: 'French-English', tag: 'Fr-En'),
  LanguageModel(languageName: 'English-Spanish', tag: 'En-Es'),
  LanguageModel(languageName: 'Spanish-English', tag: 'Es-En'),
  LanguageModel(languageName: 'Spanish-French', tag: 'Es-Fr'),
  LanguageModel(languageName: 'French-Spanish', tag: 'Fr-Es'),
  LanguageModel(languageName: 'English-German', tag: 'En-Gr'),
  LanguageModel(languageName: 'German-English', tag: 'Gr-En'),
  LanguageModel(languageName: 'English-Arabic', tag: 'En-Ar'),
  LanguageModel(languageName: 'Arabic-English', tag: 'Ar-En'),
];
const List<LanguageModel> availablePreferedLanguage = [
  LanguageModel(languageName: 'English', tag: 'En'),
  LanguageModel(languageName: 'Splanish', tag: 'Es'),
  LanguageModel(languageName: 'French', tag: 'Fr'),
  LanguageModel(languageName: 'Germany', tag: 'Gr'),
  LanguageModel(languageName: 'Arabic', tag: 'Ar'),
];
