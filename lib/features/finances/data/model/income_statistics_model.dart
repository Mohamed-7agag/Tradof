class IncomeStatisticsModel {
  final Map<String, Map<String, Map<String, num>>> yearlyData;
  final num maxValue;

  IncomeStatisticsModel({
    required this.yearlyData,
    required this.maxValue,
  });

  factory IncomeStatisticsModel.fromJson(Map<String, dynamic> json) {
    return IncomeStatisticsModel(
      yearlyData: Map<String, Map<String, Map<String, num>>>.from(
        (json['data'] as Map<String, dynamic>).map((year, monthData) => MapEntry(
          year,
          Map<String, Map<String, num>>.from(
            (monthData as Map<String, dynamic>).map((month, values) => MapEntry(
              month,
              Map<String, num>.from(values as Map<String, dynamic>),
            )),
          ),
        )),
      ),
      maxValue: json['maxValue'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': yearlyData,
      'maxValue': maxValue,
    };
  }
}