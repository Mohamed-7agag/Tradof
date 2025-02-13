part of 'freelancer_profile_cubit.dart';

enum FreelancerProfileStatus {
  initial,
  getFreelancerLoading,
  getFreelancerSuccess,
  getFreelancerFailure,

  updateSocialMediaLoading,
  updateSocialMediaSuccess,
  updateSocialMediaFailure,

  uploadCvLoading,
  uploadCvSuccess,
  uploadCvFailure,

  languagePairLoading,
  languagePairSuccess,
  languagePairFailure,

  specializationLoading,
  specializationSuccess,
  specializationFailure,
}

extension FreelancerProfileStatusX on FreelancerProfileStatus {
  bool get isInitial => this == FreelancerProfileStatus.initial;
  bool get isGetFreelancerLoading =>
      this == FreelancerProfileStatus.getFreelancerLoading;
  bool get isGetFreelancerSuccess =>
      this == FreelancerProfileStatus.getFreelancerSuccess;
  bool get isGetFreelancerFailure =>
      this == FreelancerProfileStatus.getFreelancerFailure;

  bool get isUpdateSocialMediaLoading =>
      this == FreelancerProfileStatus.updateSocialMediaLoading;
  bool get isUpdateSocialMediaSuccess =>
      this == FreelancerProfileStatus.updateSocialMediaSuccess;
  bool get isUpdateSocialMediaFailure =>
      this == FreelancerProfileStatus.updateSocialMediaFailure;

  bool get isUploadCvLoading => this == FreelancerProfileStatus.uploadCvLoading;
  bool get isUploadCvSuccess => this == FreelancerProfileStatus.uploadCvSuccess;
  bool get isUploadCvFailure => this == FreelancerProfileStatus.uploadCvFailure;

  bool get isLanguagePairLoading =>
      this == FreelancerProfileStatus.languagePairLoading;
  bool get isLanguagePairSuccess =>
      this == FreelancerProfileStatus.languagePairSuccess;
  bool get isLanguagePairFailure =>
      this == FreelancerProfileStatus.languagePairFailure;

  bool get isSpecializationLoading =>
      this == FreelancerProfileStatus.specializationLoading;
  bool get isSpecializationSuccess =>
      this == FreelancerProfileStatus.specializationSuccess;
  bool get isSpecializationFailure =>
      this == FreelancerProfileStatus.specializationFailure;
}

class FreelancerProfileState extends Equatable {
  final FreelancerProfileStatus status;
  final FreelancerModel? freelancerModel;
  final String errMessage;
  final String message;

  const FreelancerProfileState({
    this.status = FreelancerProfileStatus.initial,
    this.freelancerModel,
    this.errMessage = '',
    this.message = '',
  });

  FreelancerProfileState copyWith({
    FreelancerProfileStatus? status,
    FreelancerModel? freelancerModel,
    String? errMessage,
    String? message,
  }) =>
      FreelancerProfileState(
        status: status ?? this.status,
        freelancerModel: freelancerModel ?? this.freelancerModel,
        errMessage: errMessage ?? this.errMessage,
        message: message ?? this.message,
      );

  @override
  List<Object?> get props => [
        status,
        freelancerModel,
        errMessage,
        message,
      ];
}
