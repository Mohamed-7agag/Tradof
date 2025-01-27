import 'package:tradof/features/auth/data/model/language_model.dart';

abstract class AppConstants {
  static const String userToken = "userToken";
}

final List<String> availableSpecializationsAndServed = [
  "Legal Translation",
  "Medical Translation",
  "Marketing Translation",
  "Technical Translation",
  "Financial Translation",
];
final List<LanguageModel> availableLanguage = [
  LanguageModel(languageName: 'English-French', tag: 'En-Fr'),
  LanguageModel(languageName: 'English-Splanish', tag: 'En-es'),
  LanguageModel(languageName: 'English-French', tag: 'En-Fr'),
  LanguageModel(languageName: 'English-French', tag: 'En-Fr'),
];
