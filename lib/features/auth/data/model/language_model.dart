import 'package:equatable/equatable.dart';

class LanguageModel extends Equatable{
  final String languageName;
  final String tag;

  const LanguageModel({required this.languageName, required this.tag});

  @override
  List<Object?> get props => [languageName, tag];
}
