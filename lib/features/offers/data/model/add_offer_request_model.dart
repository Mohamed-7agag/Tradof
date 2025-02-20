import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class AddOfferRequestModel extends Equatable {

  const AddOfferRequestModel({
    required this.offerPrice,
    required this.projectId,
    required this.proposalDescription,
    required this.days,
    this.proposalAttachments = const [],
  });
  final double offerPrice;
  final int projectId;
  final String proposalDescription;
  final int days;
  final List<MultipartFile> proposalAttachments;

  Map<String, dynamic> toJson() {
    return {
      'offerPrice': offerPrice,
      'projectId': projectId,
      'proposalDescription': proposalDescription,
      'days': days,
      'proposalAttachments': proposalAttachments,
    };
  }

  @override
  List<Object?> get props => [
        offerPrice,
        projectId,
        proposalDescription,
        days,
        proposalAttachments,
  ];
}
