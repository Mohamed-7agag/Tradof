class SubscriptionModel {
  final String packageName;
  final num price;
  final int remaining;

  SubscriptionModel({
    required this.packageName,
    required this.price,
    required this.remaining,
  });

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionModel(
      packageName: json['packageName'],
      price: json['price'],
      remaining: json['remaining'],
    );
  }
}
