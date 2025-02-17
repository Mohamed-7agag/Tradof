import 'package:equatable/equatable.dart';

import 'language_model.dart';

class LanguagePairModel extends Equatable {
  final int? id;
  final LanguageModel fromLanguage;
  final LanguageModel toLanguage;

  const LanguagePairModel({
    required this.fromLanguage,
    required this.toLanguage,
    this.id,
  });

  @override
  List<Object?> get props => [fromLanguage, toLanguage, id];
}
