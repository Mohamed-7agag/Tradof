part of 'freelancer_cubit.dart';

enum FreelancerProfileStatus {
  initial,
  getFreelancerLoading,
  getFreelancerSuccess,
  getFreelancerFailure,
}

extension FreelancerProfileStatusX on FreelancerProfileStatus {
  bool get isInitial => this == FreelancerProfileStatus.initial;
  bool get isGetFreelancerLoading =>
      this == FreelancerProfileStatus.getFreelancerLoading;
  bool get isGetFreelancerSuccess =>
      this == FreelancerProfileStatus.getFreelancerSuccess;
  bool get isGetFreelancerFailure =>
      this == FreelancerProfileStatus.getFreelancerFailure;
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
