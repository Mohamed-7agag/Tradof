part of 'company_profile_cubit.dart';

enum CompanyProfileStatus {
  initial,
  getCompanyloading,
  getCompanySuccess,
  getCompanyFailure,
  preferedLanguagesLoading,
  preferedLanguagesFailure,
  preferedLanguagesSuccess,
  industriesServedLoading,
  industriesServedFailure,
  industriesServedSuccess
}

extension CompanyProfileStatusX on CompanyProfileStatus {
  bool get isGetCompanyloading =>
      this == CompanyProfileStatus.getCompanyloading;
  bool get isGetCompanySuccess =>
      this == CompanyProfileStatus.getCompanySuccess;
  bool get isGetCompanyFailure =>
      this == CompanyProfileStatus.getCompanyFailure;
  bool get isInitial => this == CompanyProfileStatus.initial;

  bool get isUpdateCompanyTablesSuccess =>
      this == CompanyProfileStatus.preferedLanguagesSuccess;
  bool get isUpdateCompanyTablesLoading =>
      this == CompanyProfileStatus.preferedLanguagesLoading;
  bool get isUpdateCompanyTablesFailure =>
      this == CompanyProfileStatus.preferedLanguagesFailure;
  bool get isIndustriesServedSuccess =>
      this == CompanyProfileStatus.industriesServedSuccess;
  bool get isIndustriesServedLoading =>
      this == CompanyProfileStatus.industriesServedLoading;
  bool get isIndustriesServedFailure =>
      this == CompanyProfileStatus.industriesServedFailure;
}

class CompanyProfileState extends Equatable {
  final CompanyProfileStatus status;
  final CompanyModel? companyModel;
  final String errorMessage;
  final String message;

  const CompanyProfileState({
    this.status = CompanyProfileStatus.initial,
    this.errorMessage = '',
    this.companyModel,
    this.message = '',
  });

  CompanyProfileState copyWith({
    CompanyProfileStatus? status,
    String? errorMessage,
    CompanyModel? companyModel,
    String? message,
  }) {
    return CompanyProfileState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      companyModel: companyModel ?? this.companyModel,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [
        status,
        errorMessage,
        companyModel ?? '',
        message,
      ];
}
