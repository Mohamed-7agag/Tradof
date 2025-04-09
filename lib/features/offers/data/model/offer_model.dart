import 'package:equatable/equatable.dart';

class OfferModel extends Equatable {
  final int id;
  final int projectId;
  final String freelancerId;
  final int proposalStatus;
  final String proposalDescription;
  final int days;
  final String? freelancerName;
  final double offerPrice;
  final String? freelancerImageUrl;
  final String? freelancerJobtitle;
  final String projecttitle;
  final DateTime timePosted;
  final List<Attachment> proposalAttachments;

  const OfferModel({
    required this.id,
    required this.projectId,
    required this.freelancerId,
    required this.proposalStatus,
    required this.proposalDescription,
    required this.days,
    required this.freelancerName,
    required this.offerPrice,
    required this.freelancerImageUrl,
    required this.freelancerJobtitle,
    required this.projecttitle,
    required this.timePosted,
    required this.proposalAttachments,
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) {
    return OfferModel(
      id: json['id'],
      projectId: json['projectId'],
      freelancerId: json['freelancerId'],
      proposalStatus: json['proposalStatus'],
      proposalDescription: json['proposalDescription'],
      days: json['days'],
      freelancerName: json['freelancerName'],
      offerPrice: json['offerPrice'].toDouble(),
      freelancerImageUrl: json['freelancerImageUrl'],
      freelancerJobtitle: json['freelancerJobtitle'],
      projecttitle: json['projecttitle'],
      timePosted: DateTime.parse(json['timePosted']),
      proposalAttachments: (json['proposalAttachments'] as List)
          .map((i) => Attachment.fromJson(i))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'projectId': projectId,
      'freelancerId': freelancerId,
      'proposalStatus': proposalStatus,
      'proposalDescription': proposalDescription,
      'days': days,
      'freelancerName': freelancerName,
      'offerPrice': offerPrice,
      'freelancerImageUrl': freelancerImageUrl,
      'freelancerJobtitle': freelancerJobtitle,
      'projecttitle': projecttitle,
      'timePosted': timePosted.toIso8601String(),
      'proposalAttachments':
          proposalAttachments.map((a) => a.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [
        id,
        projectId,
        freelancerId,
        proposalStatus,
        proposalDescription,
        days,
        freelancerName,
        offerPrice,
        freelancerImageUrl,
        freelancerJobtitle,
        projecttitle,
        timePosted,
        proposalAttachments
      ];
}

class Attachment {
  String attachmentUrl;

  Attachment({required this.attachmentUrl});

  factory Attachment.fromJson(Map<String, dynamic> json) {
    return Attachment(attachmentUrl: json['attachmentUrl']);
  }

  Map<String, dynamic> toJson() {
    return {'attachmentUrl': attachmentUrl};
  }
}
