import '../model/finance_project_model.dart';
import '../model/income_statistics_model.dart';
import '../model/statistics_model.dart';

abstract class FinancesRepo {
  Future<StatisticsModel> getStatistics({required String userId});
  Future<IncomeStatisticsModel> getIncomeStatistics();
  Future<List<FinanceProjectModel>> getFinanceProjects({bool isCompany = false});
}
