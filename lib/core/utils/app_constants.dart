import 'package:tradof/features/auth/data/model/language_model.dart';

abstract class AppConstants {
  static const String token = "userToken";
  static const String role = "role";
  static const String userId = "userId";
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
  LanguageModel(name: 'English', code: 'En',id: 1),
  LanguageModel(name: 'Splanish', code: 'Es',id: 2),
  LanguageModel(name: 'French', code: 'Fr',id: 3),
  LanguageModel(name: 'Germany', code: 'Gr',id: 4),
  LanguageModel(name: 'Arabic', code: 'Ar',id: 5),
];
