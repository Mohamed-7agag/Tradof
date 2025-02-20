import 'package:equatable/equatable.dart';

import 'language_model.dart';

class LanguagePairModel extends Equatable {

  const LanguagePairModel({
    required this.fromLanguage,
    required this.toLanguage,
    this.id,
  });
  final int? id;
  final LanguageModel fromLanguage;
  final LanguageModel toLanguage;

  @override
  List<Object?> get props => [fromLanguage, toLanguage, id];
}
