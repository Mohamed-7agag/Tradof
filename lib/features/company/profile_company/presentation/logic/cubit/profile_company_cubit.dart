import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tradof/features/company/profile_company/data/model/company_model.dart';
import 'package:tradof/features/company/profile_company/data/repos/profile_company_repo.dart';

part 'profile_company_state.dart';

class ProfileCompanyCubit extends Cubit<ProfileCompanyState> {
  ProfileCompanyCubit(this.profileCompanyRepo)
      : super(const ProfileCompanyState(status: ProfileCompanyStatus.initial));

  final ProfileCompanyRepo profileCompanyRepo;

  Future<void> getCompanyProfile({required String id}) async {
    emit(state.copyWith(status: ProfileCompanyStatus.loading));
    final result = await profileCompanyRepo.getCompanyProfrile(id: id);
    result.fold(
      (failure) => emit(state.copyWith(
        status: ProfileCompanyStatus.error,
        errorMessage: failure.errMessage,
      )),
      (companyModel) => emit(
        state.copyWith(
          status: ProfileCompanyStatus.success,
          companyModel: companyModel,
        ),
      ),
    );
  }
}
