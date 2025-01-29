import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradof/features/auth/data/repo/registeration_repo.dart';

part 'registeration_state.dart';

class RegisterationCubit extends Cubit<RegisterationState> {
  RegisterationCubit(this._registerationRepo)
      : super(const RegisterationState());
  final RegisterationRepo _registerationRepo;
  void setUserRole(UserRole role) {
    emit(state.copyWith(userRole: role));
  }

  void setCommonRegisterationData(
    String email,
    String phoneNumber,
    String password,
  ) {
    emit(state.copyWith(
      email: email,
      password: password,
      phoneNumber: phoneNumber,
    ));
  }

  void freelancerData() {}
  void companyData() {}

  Future<void> companyRegister() async {}
  Future<void> freelancerRegister() async {}
}
