import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/freelancer_model.dart';
import '../../../data/repo/freelancer_repo.dart';

part 'freelancer_state.dart';

class FreelancerProfileCubit extends Cubit<FreelancerProfileState> {
  FreelancerProfileCubit(this._freelancerRepo)
      : super(const FreelancerProfileState());
  final FreelancerRepo _freelancerRepo;

  Future<void> getFreelancerProfile() async {
    emit(state.copyWith(status: FreelancerProfileStatus.getFreelancerLoading));
    final result = await _freelancerRepo.getFreelancerProfile();
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: FreelancerProfileStatus.getFreelancerFailure,
          errMessage: failure.errMessage,
        ),
      ),
      (freelancerModel) => emit(
        state.copyWith(
          status: FreelancerProfileStatus.getFreelancerSuccess,
          freelancerModel: freelancerModel,
        ),
      ),
    );
  }
}
