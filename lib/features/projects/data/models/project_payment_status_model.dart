class ProjectPaymentStatusModel {
  final bool success;
  final bool paymentStatus;  // This will be true if status is "paid"

  ProjectPaymentStatusModel({
    required this.success,
    required this.paymentStatus,
  });

  factory ProjectPaymentStatusModel.fromJson(Map<String, dynamic> json) {
    return ProjectPaymentStatusModel(
      success: json['success'] == true || json['success'] == 'true',
      paymentStatus: json['paymentStatus']?.toString().toLowerCase() == 'paid', // Check if status is "paid"
    );
  }
}