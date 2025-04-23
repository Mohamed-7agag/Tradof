import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/exception.dart';
import '../../../../../core/utils/app_constants.dart';
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
}
