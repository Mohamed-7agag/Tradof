class IncomeStatisticsModel {
  final Map<String, Map<String, Map<String, double>>> yearlyData;

  IncomeStatisticsModel({required this.yearlyData});

  factory IncomeStatisticsModel.fromJson(Map<String, dynamic> json) {
    return IncomeStatisticsModel(
      yearlyData: Map<String, Map<String, Map<String, double>>>.from(
        json.map((key, value) => MapEntry(
          key,
          Map<String, Map<String, double>>.from(
            (value as Map<String, dynamic>).map((month, data) => MapEntry(
              month,
              Map<String, double>.from(data as Map<String, dynamic>),
            )),
          ),
        )),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return yearlyData;
  }
}