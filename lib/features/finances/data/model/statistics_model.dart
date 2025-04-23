class StatisticsModel {
  final num totalBalance;
  final num previousBalance;
  final num pendingBalance;

  const StatisticsModel({
    required this.totalBalance,
    required this.previousBalance,
    required this.pendingBalance,
  });

  factory StatisticsModel.fromJson(Map<String, dynamic> json) {
    return StatisticsModel(
      totalBalance: json['totalBalance'] ,
      previousBalance: json['previousBalance'] ,
      pendingBalance: json['pendingBalance'] ,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'totalBalance': totalBalance,
      'previousBalance': previousBalance,
      'pendingBalance': pendingBalance,
    };
  }
}
