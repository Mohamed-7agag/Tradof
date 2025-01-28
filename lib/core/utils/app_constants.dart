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
const List<String> availableLanguages = [
  'English',
  'French',
  'Spanish',
  'German',
  'Arabic',
  'Italian',
  'Portuguese',
  'Russian',
  'Chinese',
  'Japanese',
  'Korean',
  'Hindi',
];

const Map<String, String> availableTags = {
  'English': 'En',
  'French': 'Fr',
  'Spanish': 'Es',
  'German': 'Gr',
  'Arabic': 'Ar',
  'Italian': 'It',
  'Portuguese': 'Pt',
  'Russian': 'Ru',
  'Chinese': 'Ch',
  'Japanese': 'Ja',
  'Korean': 'Kr',
  'Hindi': 'Hi',
};
const List<LanguageModel> availablePreferedLanguage = [
  LanguageModel(languageName: 'English', tag: 'En'),
  LanguageModel(languageName: 'Splanish', tag: 'Es'),
  LanguageModel(languageName: 'French', tag: 'Fr'),
  LanguageModel(languageName: 'Germany', tag: 'Gr'),
  LanguageModel(languageName: 'Arabic', tag: 'Ar'),
];
