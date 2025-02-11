import 'package:equatable/equatable.dart';


class CreateOfferRequestModel extends Equatable {
  final double offerPrice;
  final int projectId;
  final String proposalDescription;
  final DateTime projectDeliveryTime;
  final List<String> proposalAttachments;

  const CreateOfferRequestModel({
    required this.offerPrice,
    required this.projectId,
    required this.proposalDescription,
    required this.projectDeliveryTime,
    this.proposalAttachments = const [],
  });

  Map<String, dynamic> toJson() {
    return {
      'offerPrice': offerPrice,
      'projectId': projectId,
      'proposalDescription': proposalDescription,
      'projectDeliveryTime': projectDeliveryTime.toIso8601String(),
      'proposalAttachments': proposalAttachments,
    };
  }

  @override
  List<Object?> get props => [
        offerPrice,
        projectId,
        proposalDescription,
        projectDeliveryTime,
        proposalAttachments
      ];
}
