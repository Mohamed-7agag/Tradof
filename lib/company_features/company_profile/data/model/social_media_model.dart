import 'package:equatable/equatable.dart';

class SocialMediaModel extends Equatable {

  const SocialMediaModel({
    required this.platformType,
    required this.link,
    this.id,
  });

  factory SocialMediaModel.fromJson(Map<String, dynamic> json) {
    return SocialMediaModel(
      platformType: json['platformType'],
      link: json['link'],
      id: json['_id'],
    );
  }
  final String platformType;
  final String link;
  final String? id;

  Map<String, dynamic> toJson() {
    return {
      'platformType': platformType,
      'link': link,
      '_id': id,
    };
  }

  @override
  List<Object?> get props => [
        platformType,
        link,
        id,
      ];
}
