part of 'finances_cubit.dart';

enum FinancesStatus {
  initial,
  getStatisticsLoading,
  getStatisticsSuccess,
  getStatisticsFailure,
}

extension FinancesStatusX on FinancesStatus {
  bool get isInitial => this == FinancesStatus.initial;
  bool get isGetStatisticsLoading =>
      this == FinancesStatus.getStatisticsLoading;
  bool get isGetStatisticsSuccess =>
      this == FinancesStatus.getStatisticsSuccess;
  bool get isGetStatisticsFailure =>
      this == FinancesStatus.getStatisticsFailure;
}

class FinancesState extends Equatable {
  final FinancesStatus status;
  final StatisticsModel? statisticsModel;
  final String errorMessage;

  const FinancesState({
    this.status = FinancesStatus.initial,
    this.statisticsModel,
    this.errorMessage = '',
  });

  FinancesState copyWith({
    FinancesStatus? status,
    StatisticsModel? statisticsModel,
    String? errorMessage,
  }) {
    return FinancesState(
      status: status ?? this.status,
      statisticsModel: statisticsModel ?? this.statisticsModel,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        statisticsModel,
        errorMessage,
      ];
}
