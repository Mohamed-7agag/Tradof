import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'registeration_state.dart';

class RegisterationCubit extends Cubit<RegisterationState> {
  RegisterationCubit() : super(const RegisterationState());

  void userRole(String role) {
    emit(state.copyWith(userRole: role));
  }

  void commonRegisteration(
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

  Future<void> register() async {
    // depend on role to know if freelancer or company and make api request
  }
}
