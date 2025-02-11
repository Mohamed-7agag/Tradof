part of 'freelancer_setting_cubit.dart';

enum FreelancerSettingStatus {
  initial,
  changePasswordLoading,
  changePasswordSuccess,
  changePasswordFailure,
  updateCompanyProfileLoading,
  updateCompanyProfileFailure,
  updateCompanyProfileSuccess,
}

extension FreelancerSettingStatusX on FreelancerSettingStatus {
  bool get isChangePasswordLoading =>
      this == FreelancerSettingStatus.changePasswordLoading;
  bool get isChangePasswordSuccess =>
      this == FreelancerSettingStatus.changePasswordSuccess;
  bool get isChangePasswordFailure =>
      this == FreelancerSettingStatus.changePasswordFailure;
  bool get isUpdateCompanyProfileLoading =>
      this == FreelancerSettingStatus.updateCompanyProfileLoading;
  bool get isUpdateCompanyProfileSuccess =>
      this == FreelancerSettingStatus.updateCompanyProfileSuccess;
  bool get isUpdateCompanyProfileFailure =>
      this == FreelancerSettingStatus.updateCompanyProfileFailure;
}

class FreelancerSettingState extends Equatable {
  final FreelancerSettingStatus status;
  final String errMessage;
  final String message;
  final int? countryId;
  final File? imagePicked;

  const FreelancerSettingState({
    this.status = FreelancerSettingStatus.initial,
    this.errMessage = '',
    this.message = '',
    this.countryId,
    this.imagePicked,
  });

  FreelancerSettingState copyWith({
    FreelancerSettingStatus? status,
    String? errMessage,
    String? message,
    int? countryId,
    File? imagePicked,
  }) {
    return FreelancerSettingState(
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
