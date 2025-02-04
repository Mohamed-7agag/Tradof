part of 'company_setting_cubit.dart';

enum CompanySettingStatus {
  initial,
  changePasswordLoading,
  changePasswordSuccess,
  changePasswordFailure,
}

extension CompanySettingStatusX on CompanySettingStatus {
  bool get isChangePasswordLoading =>
      this == CompanySettingStatus.changePasswordLoading;
  bool get isChangePasswordSuccess =>
      this == CompanySettingStatus.changePasswordSuccess;
  bool get isChangePasswordFailure =>
      this == CompanySettingStatus.changePasswordFailure;
}

class CompanySettingState extends Equatable {
  final CompanySettingStatus status;
  final String errMessage;
  final String message;

  const CompanySettingState({
    this.status = CompanySettingStatus.initial,
    this.errMessage = '',
    this.message = '',
  });

  CompanySettingState copyWith({
    CompanySettingStatus? status,
    String? errMessage,
    String? message,
  }) {
    return CompanySettingState(
      status: status ?? this.status,
      errMessage: errMessage ?? this.errMessage,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [status, errMessage, message];
}
