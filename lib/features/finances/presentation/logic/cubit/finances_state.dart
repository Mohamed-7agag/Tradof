part of 'finances_cubit.dart';

enum FinancesStatus {
  initial,
  getStatisticsLoading,
  getStatisticsSuccess,
  getStatisticsFailure,
  getIncomeStatisticsLoading,
  getIncomeStatisticsSuccess,
  getIncomeStatisticsFailure,
  getFinanceProjectLoading,
  getFinanceProjectSuccess,
  getFinanceProjectFailure,
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
  bool get isGetFinanceProjectLoading =>
      this == FinancesStatus.getFinanceProjectLoading;
  bool get isGetFinanceProjectSuccess =>
      this == FinancesStatus.getFinanceProjectSuccess;
  bool get isGetFinanceProjectFailure =>
      this == FinancesStatus.getFinanceProjectFailure;
}

class FinancesState extends Equatable {
  final FinancesStatus status;
  final StatisticsModel? statisticsModel;
  final IncomeStatisticsModel? incomeStatisticsModel;
  final List<FinanceProjectModel> financeProjects;
  final String errorMessage;

  const FinancesState({
    this.status = FinancesStatus.initial,
    this.statisticsModel,
    this.errorMessage = '',
    this.financeProjects = const [],
    this.incomeStatisticsModel,
  });

  FinancesState copyWith({
    FinancesStatus? status,
    StatisticsModel? statisticsModel,
    String? errorMessage,
    List<FinanceProjectModel>? financeProjects,
    IncomeStatisticsModel? incomeStatisticsModel,
  }) {
    return FinancesState(
      status: status ?? this.status,
      statisticsModel: statisticsModel ?? this.statisticsModel,
      errorMessage: errorMessage ?? this.errorMessage,
      incomeStatisticsModel:
          incomeStatisticsModel ?? this.incomeStatisticsModel,
      financeProjects: financeProjects ?? this.financeProjects,
    );
  }

  @override
  List<Object?> get props => [
        status,
        statisticsModel,
        errorMessage,
        incomeStatisticsModel,
        financeProjects,
      ];
}
