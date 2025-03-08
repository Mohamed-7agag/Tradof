import 'package:equatable/equatable.dart';

class OfferModel extends Equatable {
  final int id;
  final int projectId;
  final int freelancerId;
  final String proposalStatus;
  final String proposalDescription;
  final int projectDeliveryTime;
  final String freelancerName;
  final double offerPrice;
  final String freelancerImageUrl;
  final String freelancerJobtitle;
  final String projecttitle;
  final DateTime timePosted;
  final List<Attachment> proposalAttachments;

 const OfferModel({
    required this.id,
    required this.projectId,
    required this.freelancerId,
    required this.proposalStatus,
    required this.proposalDescription,
    required this.projectDeliveryTime,
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
      id: json['Id'],
      projectId: json['ProjectId'],
      freelancerId: json['FreelancerId'],
      proposalStatus: json['ProposalStatus'],
      proposalDescription: json['ProposalDescription'],
      projectDeliveryTime: json['ProjectDeliveryTime'],
      freelancerName: json['FreelancerName'],
      offerPrice: json['OfferPrice'].toDouble(),
      freelancerImageUrl: json['FreelancerImageUrl'],
      freelancerJobtitle: json['FreelancerJobtitle'],
      projecttitle: json['Projecttitle'],
      timePosted: DateTime.parse(json['TimePosted']),
      proposalAttachments: (json['ProposalAttachments'] as List)
          .map((i) => Attachment.fromJson(i))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'ProjectId': projectId,
      'FreelancerId': freelancerId,
      'ProposalStatus': proposalStatus,
      'ProposalDescription': proposalDescription,
      'ProjectDeliveryTime': projectDeliveryTime,
      'FreelancerName': freelancerName,
      'OfferPrice': offerPrice,
      'FreelancerImageUrl': freelancerImageUrl,
      'FreelancerJobtitle': freelancerJobtitle,
      'Projecttitle': projecttitle,
      'TimePosted': timePosted.toIso8601String(),
      'ProposalAttachments':
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
        projectDeliveryTime,
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
  int attachmentId;
  String attachmentName;
  String attachmentUrl;

  Attachment(
      {required this.attachmentId,
      required this.attachmentName,
      required this.attachmentUrl});

  factory Attachment.fromJson(Map<String, dynamic> json) {
    return Attachment(
      attachmentId: json['AttachmentId'],
      attachmentName: json['AttachmentName'],
      attachmentUrl: json['AttachmentUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'AttachmentId': attachmentId,
      'AttachmentName': attachmentName,
      'AttachmentUrl': attachmentUrl,
    };
  }
}
