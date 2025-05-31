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
  withdrawalLoading,
  withdrawalSuccess,
  withdrawalFailure,
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
  bool get isWithdrawalLoading => this == FinancesStatus.withdrawalLoading;
  bool get isWithdrawalSuccess => this == FinancesStatus.withdrawalSuccess;
  bool get isWithdrawalFailure => this == FinancesStatus.withdrawalFailure;
}

class FinancesState extends Equatable {
  final FinancesStatus status;
  final StatisticsModel? statisticsModel;
  final IncomeStatisticsModel? incomeStatisticsModel;
  final List<FinanceProjectModel> financeProjects;
  final String errorMessage;
  final bool withdrawCheckboxValue1;
  final bool withdrawCheckboxValue2;
  final bool withdrawCheckboxValue3;

  const FinancesState({
    this.status = FinancesStatus.initial,
    this.statisticsModel,
    this.errorMessage = '',
    this.financeProjects = const [],
    this.incomeStatisticsModel,
    this.withdrawCheckboxValue1 = false,
    this.withdrawCheckboxValue2 = false,
    this.withdrawCheckboxValue3 = false,
  });

  FinancesState copyWith({
    FinancesStatus? status,
    StatisticsModel? statisticsModel,
    String? errorMessage,
    List<FinanceProjectModel>? financeProjects,
    IncomeStatisticsModel? incomeStatisticsModel,
    bool? withdrawCheckboxValue1,
    bool? withdrawCheckboxValue2,
    bool? withdrawCheckboxValue3,
  }) {
    return FinancesState(
      status: status ?? this.status,
      statisticsModel: statisticsModel ?? this.statisticsModel,
      errorMessage: errorMessage ?? this.errorMessage,
      incomeStatisticsModel:
          incomeStatisticsModel ?? this.incomeStatisticsModel,
      financeProjects: financeProjects ?? this.financeProjects,
      withdrawCheckboxValue1:
          withdrawCheckboxValue1 ?? this.withdrawCheckboxValue1,
      withdrawCheckboxValue2:
          withdrawCheckboxValue2 ?? this.withdrawCheckboxValue2,
      withdrawCheckboxValue3:
          withdrawCheckboxValue3 ?? this.withdrawCheckboxValue3,
    );
  }

  @override
  List<Object?> get props => [
        status,
        statisticsModel,
        errorMessage,
        incomeStatisticsModel,
        financeProjects,
        withdrawCheckboxValue1,
        withdrawCheckboxValue2,
        withdrawCheckboxValue3,
      ];
}
