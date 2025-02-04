part of 'company_profile_cubit.dart';

enum CompanyProfileStatus {
  initial,
  loading,
  companyDataFetched,
  error,
  addPreferredLanguage,
  deletePreferredLanguage,
  addIndustriesServed,
  deleteIndustriesServed,
  updateCompanyProfileLoading,
  updateCompanyProfileFailure,
  updateCompanyProfileSuccess,
}

extension CompanyProfileStatusX on CompanyProfileStatus {
  bool get isLoading => this == CompanyProfileStatus.loading;
  bool get companyDataFetched =>
      this == CompanyProfileStatus.companyDataFetched;
  bool get isError => this == CompanyProfileStatus.error;
  bool get isInitial => this == CompanyProfileStatus.initial;
  bool get isAddPreferredLanguage =>
      this == CompanyProfileStatus.addPreferredLanguage;
  bool get isDeletePreferredLanguage =>
      this == CompanyProfileStatus.deletePreferredLanguage;
  bool get isAddIndustriesServed =>
      this == CompanyProfileStatus.addIndustriesServed;
  bool get isDeleteIndustriesServed =>
      this == CompanyProfileStatus.deleteIndustriesServed;
  bool get isUpdateCompanyProfileSuccess =>
      this == CompanyProfileStatus.updateCompanyProfileSuccess;
  bool get isUpdateCompanyProfileLoading =>
      this == CompanyProfileStatus.updateCompanyProfileLoading;
  bool get isUpdateCompanyProfileFailure =>
      this == CompanyProfileStatus.updateCompanyProfileFailure;
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
