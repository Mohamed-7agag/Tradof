part of 'freelancer_setting_cubit.dart';

enum FreelancerSettingStatus {
  initial,
  changePasswordLoading,
  changePasswordSuccess,
  changePasswordFailure,
  updateFreelancerProfileLoading,
  updateFreelancerProfileFailure,
  updateFreelancerProfileSuccess,
}

extension FreelancerSettingStatusX on FreelancerSettingStatus {
  bool get isChangePasswordLoading =>
      this == FreelancerSettingStatus.changePasswordLoading;
  bool get isChangePasswordSuccess =>
      this == FreelancerSettingStatus.changePasswordSuccess;
  bool get isChangePasswordFailure =>
      this == FreelancerSettingStatus.changePasswordFailure;
  bool get isUpdateFreelancerProfileLoading =>
      this == FreelancerSettingStatus.updateFreelancerProfileLoading;
  bool get isUpdateFreelancerProfileSuccess =>
      this == FreelancerSettingStatus.updateFreelancerProfileSuccess;
  bool get isUpdateFreelancerProfileFailure =>
      this == FreelancerSettingStatus.updateFreelancerProfileFailure;
}

class FreelancerSettingState extends Equatable {

  const FreelancerSettingState({
    this.status = FreelancerSettingStatus.initial,
    this.errMessage = '',
    this.message = '',
    this.countryId,
    this.imagePicked,
  });
  final FreelancerSettingStatus status;
  final String errMessage;
  final String message;
  final int? countryId;
  final File? imagePicked;

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
