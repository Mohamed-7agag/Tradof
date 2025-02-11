import 'package:equatable/equatable.dart';
import 'package:tradof/core/utils/models/language_model.dart';

class LanguagePairModel extends Equatable {
  final LanguageModel fromLanguage;
  final LanguageModel toLanguage;

  const LanguagePairModel({
    required this.fromLanguage,
    required this.toLanguage,
  });

  @override
  List<Object?> get props => [fromLanguage, toLanguage];
}
