part of 'profile_company_cubit.dart';

enum ProfileCompanyStatus {
  initial,
  loading,
  success,
  error,
}

extension ProfileCompanyStatusX on ProfileCompanyStatus {
  bool get isLoading => this == ProfileCompanyStatus.loading;
  bool get isSuccess => this == ProfileCompanyStatus.success;
  bool get isError => this == ProfileCompanyStatus.error;
  bool get isInitial => this == ProfileCompanyStatus.initial;
}

class ProfileCompanyState extends Equatable {
  final ProfileCompanyStatus status;
  final String? errorMessage;
  final CompanyModel? companyModel;

  const ProfileCompanyState({
    required this.status,
    this.errorMessage ,
    this.companyModel,
  });

  ProfileCompanyState copyWith({
    ProfileCompanyStatus? status,
    String? errorMessage,
    CompanyModel? companyModel,
  }) {
    return ProfileCompanyState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      companyModel: companyModel ?? this.companyModel,
    );
  }

  @override
  List<Object> get props => [
        status,
        errorMessage ?? '',
        companyModel ?? '',
      ];
}
