part of 'registeration_cubit.dart';

enum RegisterationStatus {
  initial,
  registerationLoading,
  registerationSuccess,
  registerationFailure,
}

enum UserRole { freelancer, company }

extension RegisterationStepX on RegisterationStatus {
  bool get isRegisterationLoading =>
      this == RegisterationStatus.registerationLoading;
  bool get isRegisterationSuccess =>
      this == RegisterationStatus.registerationSuccess;
  bool get isRegisterationFailure =>
      this == RegisterationStatus.registerationFailure;
}

class RegisterationState extends Equatable {
  const RegisterationState({
    this.status = RegisterationStatus.initial,
    this.userRole = UserRole.freelancer,
    this.errorMessage = '',
    this.successMessage = '',
    this.email = '',
    this.phoneNumber = '',
    this.password = '',
    this.firstName = '',
    this.lastName = '',
    this.imageProfile,
    this.countryId,
  });
  final RegisterationStatus status;
  final UserRole userRole;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String password;
  final String errorMessage;
  final String successMessage;
  final File? imageProfile;
  final int? countryId;

  RegisterationState copyWith({
    RegisterationStatus? status,
    UserRole? userRole,
    String? errorMessage,
    String? registerSuccessMessage,
    String? email,
    String? phoneNumber,
    String? password,
    String? firstName,
    String? lastName,
    File? imageProfile,
    int? countryId,
  }) {
    return RegisterationState(
      status: status ?? this.status,
      userRole: userRole ?? this.userRole,
      errorMessage: errorMessage ?? this.errorMessage,
      successMessage: registerSuccessMessage ?? successMessage,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      imageProfile: imageProfile ?? this.imageProfile,
      countryId: countryId ?? this.countryId,
    );
  }

  @override
  List<Object> get props => [
        status,
        userRole,
        errorMessage,
        successMessage,
        email,
        phoneNumber,
        password,
        firstName,
        lastName,
        imageProfile ?? '',
        countryId ?? 0,
      ];
}
