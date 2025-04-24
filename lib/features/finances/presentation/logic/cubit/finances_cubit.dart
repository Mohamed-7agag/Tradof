import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/exception.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../data/model/finance_project_model.dart';
import '../../../data/model/income_statistics_model.dart';
import '../../../data/model/statistics_model.dart';
import '../../../data/repo/finances_repo.dart';

part 'finances_state.dart';

class FinancesCubit extends Cubit<FinancesState> {
  FinancesCubit(this._financesRepo) : super(const FinancesState());
  final FinancesRepo _financesRepo;

  Future<void> getStatistics() async {
    emit(state.copyWith(status: FinancesStatus.getStatisticsLoading));
    try {
      final statisticsModel = await _financesRepo.getStatistics(
        userId: AppConstants.kUserId,
      );
      emit(state.copyWith(
        status: FinancesStatus.getStatisticsSuccess,
        statisticsModel: statisticsModel,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: FinancesStatus.getStatisticsFailure,
        errorMessage: ServerFailure.fromError(e).errMessage,
      ));
    }
  }

  Future<void> getIncomeStatistics() async {
    emit(state.copyWith(status: FinancesStatus.getIncomeStatisticsLoading));
    try {
      final incomeStatisticsModel = await _financesRepo.getIncomeStatistics();
      emit(state.copyWith(
        status: FinancesStatus.getIncomeStatisticsSuccess,
        incomeStatisticsModel: incomeStatisticsModel,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: FinancesStatus.getIncomeStatisticsFailure,
        errorMessage: ServerFailure.fromError(e).errMessage,
      ));
    }
  }

  Future<void> getFinanceProjects({bool isCompany = false}) async {
    emit(state.copyWith(status: FinancesStatus.getFinanceProjectLoading));
    try {
      final financeProjects =
          await _financesRepo.getFinanceProjects(isCompany: isCompany);
      emit(state.copyWith(
        status: FinancesStatus.getFinanceProjectSuccess,
        financeProjects: financeProjects,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: FinancesStatus.getFinanceProjectFailure,
        errorMessage: ServerFailure.fromError(e).errMessage,
      ));
    }
  }
}
