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
  industriesServedSuccess,
  getCompanyEmployeesLoading,
  getCompanyEmployeesSuccess,
  getCompanyEmployeesFailure,
  addCompanyEmployeesLoading,
  addCompanyEmployeesSuccess,
  addCompanyEmployeesFailure,

  addUpdateSocialMediaLoading,
  addUpdateSocialMediaFailure,
  addUpdateSocialMediaSuccess,
}

extension CompanyProfileStatusX on CompanyProfileStatus {
  bool get isGetCompanyloading =>
      this == CompanyProfileStatus.getCompanyloading;
  bool get isGetCompanySuccess =>
      this == CompanyProfileStatus.getCompanySuccess;
  bool get isGetCompanyFailure =>
      this == CompanyProfileStatus.getCompanyFailure;
  bool get isInitial => this == CompanyProfileStatus.initial;

  bool get isPreferedLanguagesSuccess =>
      this == CompanyProfileStatus.preferedLanguagesSuccess;
  bool get isPreferedLanguagesLoading =>
      this == CompanyProfileStatus.preferedLanguagesLoading;
  bool get isPreferedLanguagesFailure =>
      this == CompanyProfileStatus.preferedLanguagesFailure;

  bool get isIndustriesServedSuccess =>
      this == CompanyProfileStatus.industriesServedSuccess;
  bool get isIndustriesServedLoading =>
      this == CompanyProfileStatus.industriesServedLoading;
  bool get isIndustriesServedFailure =>
      this == CompanyProfileStatus.industriesServedFailure;

  bool get isGetCompanyEmployeesLoading =>
      this == CompanyProfileStatus.getCompanyEmployeesLoading;
  bool get isGetCompanyEmployeesSuccess =>
      this == CompanyProfileStatus.getCompanyEmployeesSuccess;
  bool get isGetCompanyEmployeesFailure =>
      this == CompanyProfileStatus.getCompanyEmployeesFailure;

  bool get isAddCompanyEmployeesLoading =>
      this == CompanyProfileStatus.addCompanyEmployeesLoading;
  bool get isAddCompanyEmployeesSuccess =>
      this == CompanyProfileStatus.addCompanyEmployeesSuccess;
  bool get isAddCompanyEmployeesFailure =>
      this == CompanyProfileStatus.addCompanyEmployeesFailure;

  bool get isAddUpdateSocialMediaLoading =>
      this == CompanyProfileStatus.addUpdateSocialMediaLoading;
  bool get isAddUpdateSocialMediaSuccess =>
      this == CompanyProfileStatus.addUpdateSocialMediaSuccess;
  bool get isAddUpdateSocialMediaFailure =>
      this == CompanyProfileStatus.addUpdateSocialMediaFailure;
}

class CompanyProfileState extends Equatable {
  final CompanyProfileStatus status;
  final CompanyModel? companyModel;
  final List<CompanyEmployeeModel> companyEmployees;
  final String errorMessage;
  final String? groupName;
  final int? countryId;
  final String message;

  const CompanyProfileState({
    this.status = CompanyProfileStatus.initial,
    this.companyEmployees = const [],
    this.errorMessage = '',
    this.companyModel,
    this.message = '',
    this.groupName,
    this.countryId,
  });

  CompanyProfileState copyWith({
    CompanyProfileStatus? status,
    List<CompanyEmployeeModel>? companyEmployees,
    String? errorMessage,
    CompanyModel? companyModel,
    String? message,
    String? groupName,
    int? countryId,
  }) {
    return CompanyProfileState(
      status: status ?? this.status,
      companyEmployees: companyEmployees ?? this.companyEmployees,
      errorMessage: errorMessage ?? this.errorMessage,
      companyModel: companyModel ?? this.companyModel,
      message: message ?? this.message,
      groupName: groupName ?? this.groupName,
      countryId: countryId ?? this.countryId,
    );
  }

  @override
  List<Object> get props => [
        status,
        companyEmployees,
        errorMessage,
        companyModel ?? '',
        message,
        groupName ?? '',
        countryId ?? 0
      ];
}
