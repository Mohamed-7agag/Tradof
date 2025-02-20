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

  const RegisterationState({
    this.status = RegisterationStatus.initial,
    this.userRole = UserRole.freelancer,
    this.errorMessage = '',
    this.registerSuccessMessage = '',
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
  final String registerSuccessMessage;
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
      registerSuccessMessage:
          registerSuccessMessage ?? this.registerSuccessMessage,
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
        registerSuccessMessage,
        email,
        phoneNumber,
        password,
        firstName,
        lastName,
        imageProfile ?? '',
        countryId ?? 0,
      ];
}
