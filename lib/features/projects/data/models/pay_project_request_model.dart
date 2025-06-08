class PayProjectRequestModel {
  final int projectId;
  final String freelancerId;
  final int budget;
  final String deliveryTime;

  PayProjectRequestModel({
    required this.projectId,
    required this.freelancerId,
    required this.budget,
    required this.deliveryTime,
  });

  

  Map<String, dynamic> toJson() {
    return {
      'projectId': projectId,
      'freelancerId': freelancerId,
      'budget': budget,
      'deliveryTime': deliveryTime,
    };
  }
}
