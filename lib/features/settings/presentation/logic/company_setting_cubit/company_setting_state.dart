part of 'company_setting_cubit.dart';

enum CompanySettingStatus {
  initial,
  changePasswordLoading,
  changePasswordSuccess,
  changePasswordFailure,
  updateCompanyProfileLoading,
  updateCompanyProfileFailure,
  updateCompanyProfileSuccess,
}

extension CompanySettingStatusX on CompanySettingStatus {
  bool get isChangePasswordLoading =>
      this == CompanySettingStatus.changePasswordLoading;
  bool get isChangePasswordSuccess =>
      this == CompanySettingStatus.changePasswordSuccess;
  bool get isChangePasswordFailure =>
      this == CompanySettingStatus.changePasswordFailure;
  bool get isUpdateCompanyProfileLoading =>
      this == CompanySettingStatus.updateCompanyProfileLoading;
  bool get isUpdateCompanyProfileSuccess =>
      this == CompanySettingStatus.updateCompanyProfileSuccess;
  bool get isUpdateCompanyProfileFailure =>
      this == CompanySettingStatus.updateCompanyProfileFailure;
}

class CompanySettingState extends Equatable {

  const CompanySettingState({
    this.status = CompanySettingStatus.initial,
    this.errMessage = '',
    this.message = '',
    this.countryId,
    this.imagePicked,
  });
  final CompanySettingStatus status;
  final String errMessage;
  final String message;
  final int? countryId;
  final File? imagePicked;

  CompanySettingState copyWith({
    CompanySettingStatus? status,
    String? errMessage,
    String? message,
    int? countryId,
    File? imagePicked,
  }) {
    return CompanySettingState(
      status: status ?? this.status,
      errMessage: errMessage ?? this.errMessage,
      message: message ?? this.message,
      countryId: countryId ?? this.countryId,
      imagePicked: imagePicked ?? this.imagePicked,
    );
  }

  @override
  List<Object?> get props => [
        status,
        errMessage,
        message,
        countryId,
        imagePicked,
      ];
}
