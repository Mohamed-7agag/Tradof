class WithdrawalModel {
  final double amount;
  final String name;
  final String iban;
  final String swiftCode;
  final String addressLine1;
  final String addressLine2;
  final String city;
  final String state;
  final String country;
  final String? postalCode;

  WithdrawalModel({
    required this.amount,
    required this.name,
    required this.iban,
    required this.swiftCode,
    required this.addressLine1,
    required this.addressLine2,
    required this.city,
    required this.state,
    required this.country,
    required this.postalCode,
  });

  factory WithdrawalModel.fromJson(Map<String, dynamic> json) {
    return WithdrawalModel(
      amount: json['amount']?.toDouble() ?? 0.0,
      name: json['paymentDetails']['name'] ?? '',
      iban: json['paymentDetails']['iban'] ?? '',
      swiftCode: json['paymentDetails']['swiftCode'] ?? '',
      addressLine1: json['paymentDetails']['addressLine1'] ?? '',
      addressLine2: json['paymentDetails']['addressLine2'] ?? '',
      city: json['paymentDetails']['city'] ?? '',
      state: json['paymentDetails']['state'] ?? '',
      country: json['paymentDetails']['country'] ?? '',
      postalCode: json['paymentDetails']['postalCode'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'paymentDetails': {
        'name': name,
        'iban': iban,
        'swiftCode': swiftCode,
        'addressLine1': addressLine1,
        'addressLine2': addressLine2,
        'city': city,
        'state': state,
        'country': country,
        'postalCode': postalCode,
      }
    };
  }
}