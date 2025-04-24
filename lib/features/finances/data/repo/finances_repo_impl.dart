import '../../../../core/api/api_service.dart';
import '../../../../core/api/end_points.dart';
import '../model/finance_project_model.dart';
import '../model/income_statistics_model.dart';
import '../model/statistics_model.dart';
import 'finances_repo.dart';

class FinancesRepoImpl implements FinancesRepo {
  final ApiServices _apiServices;

  FinancesRepoImpl({required ApiServices apiServices})
      : _apiServices = apiServices;
  @override
  Future<StatisticsModel> getStatistics({required String userId}) async {
    final response = await _apiServices.get(
      EndPoint.statistics(userId),
    );
    return StatisticsModel.fromJson(response['data']);
  }

  @override
  Future<IncomeStatisticsModel> getIncomeStatistics() async {
    final response = await _apiServices.get(
      EndPoint.getIncomeStatistics,
    );
    return IncomeStatisticsModel.fromJson(response['data']);
  }

  @override
  Future<List<FinanceProjectModel>> getFinanceProjects(
      {bool isCompany = false}) async {
    final response = await _apiServices.get(
      isCompany
          ? EndPoint.companyFinancialProjects
          : EndPoint.freelancerFinancialProjects,
    );
    return List<FinanceProjectModel>.from(
      response['data'].map(
        (e) => FinanceProjectModel.fromJson(e),
      ),
    );
  }
}
