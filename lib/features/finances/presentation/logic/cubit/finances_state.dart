part of 'finances_cubit.dart';

enum FinancesStatus {
  initial,
  getStatisticsLoading,
  getStatisticsSuccess,
  getStatisticsFailure,
  getIncomeStatisticsLoading,
  getIncomeStatisticsSuccess,
  getIncomeStatisticsFailure,
}

extension FinancesStatusX on FinancesStatus {
  bool get isInitial => this == FinancesStatus.initial;
  bool get isGetStatisticsLoading =>
      this == FinancesStatus.getStatisticsLoading;
  bool get isGetStatisticsSuccess =>
      this == FinancesStatus.getStatisticsSuccess;
  bool get isGetStatisticsFailure =>
      this == FinancesStatus.getStatisticsFailure;
  bool get isGetIncomeStatisticsLoading =>
      this == FinancesStatus.getIncomeStatisticsLoading;
  bool get isGetIncomeStatisticsSuccess =>
      this == FinancesStatus.getIncomeStatisticsSuccess;
  bool get isGetIncomeStatisticsFailure =>
      this == FinancesStatus.getIncomeStatisticsFailure;
}

class FinancesState extends Equatable {
  final FinancesStatus status;
  final StatisticsModel? statisticsModel;
  final IncomeStatisticsModel ? incomeStatisticsModel;
  final String errorMessage;

  const FinancesState({
    this.status = FinancesStatus.initial,
    this.statisticsModel,
    this.errorMessage = '',
    this.incomeStatisticsModel,
  });

  FinancesState copyWith({
    FinancesStatus? status,
    StatisticsModel? statisticsModel,
    String? errorMessage,
    IncomeStatisticsModel? incomeStatisticsModel,
  }) {
    return FinancesState(
      status: status ?? this.status,
      statisticsModel: statisticsModel ?? this.statisticsModel,
      errorMessage: errorMessage ?? this.errorMessage,
      incomeStatisticsModel: incomeStatisticsModel ?? this.incomeStatisticsModel,
    );
  }

  @override
  List<Object?> get props => [
        status,
        statisticsModel,
        errorMessage,
      ];
}
