import '../../../../core/api/api_service.dart';
import '../../../../core/api/end_points.dart';
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
}
