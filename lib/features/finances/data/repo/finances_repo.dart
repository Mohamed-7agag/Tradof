import '../model/statistics_model.dart';

abstract class FinancesRepo {
  Future<StatisticsModel> getStatistics({required String userId});
}
