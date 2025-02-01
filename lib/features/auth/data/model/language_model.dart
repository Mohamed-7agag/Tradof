import 'package:equatable/equatable.dart';

class LanguageModel extends Equatable {
  final int id;
  final String name;
  final String code;

  const LanguageModel(
      {required this.id, required this.name, required this.code});

  factory LanguageModel.fromJson(Map<String, dynamic> json) {
    return LanguageModel(
      id: json['id'],
      name: json['name'],
      code: json['code'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'code': code,
      };

  @override
  List<Object?> get props => [id, name, code];
}
