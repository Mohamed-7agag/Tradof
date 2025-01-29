part of 'registeration_cubit.dart';

enum RegisterationStatus {
  initial,
  loading,
  success,
  error,
}

enum UserRole { freelancer, company }

extension RegisterationStepX on RegisterationStatus {
  bool get isLoading => this == RegisterationStatus.loading;
  bool get isRegistered => this == RegisterationStatus.success;
  bool get isError => this == RegisterationStatus.error;
}

class RegisterationState extends Equatable {
  final RegisterationStatus status;
  final UserRole userRole;
  final String email;
  final String phoneNumber;
  final String password;
  final String country;
  // language pair
  // specialization
  // industry served
  // prefered language
  final String errorMessage;
  const RegisterationState({
    this.status = RegisterationStatus.initial,
    this.userRole = UserRole.freelancer,
    this.errorMessage = '',
    this.email = '',
    this.phoneNumber = '',
    this.password = '',
    this.country = '',
  });

  RegisterationState copyWith({
    RegisterationStatus? status,
    UserRole? userRole,
    String? errorMessage,
    String? email,
    String? phoneNumber,
    String? password,
    String? country,
  }) {
    return RegisterationState(
      status: status ?? this.status,
      userRole: userRole ?? this.userRole,
      errorMessage: errorMessage ?? this.errorMessage,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      country: country ?? this.country,
    );
  }

  @override
  List<Object> get props => [
        status,
        userRole,
        errorMessage,
        email,
        phoneNumber,
        password,
        country,
      ];
}
