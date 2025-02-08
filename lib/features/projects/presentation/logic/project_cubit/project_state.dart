part of 'project_cubit.dart';

enum ProjectStatus {
  initial,
  loading,
  success,
  error,
}

extension ProjectStatusX on ProjectStatus {
  bool get isLoading => this == ProjectStatus.loading;
  bool get isSuccess => this == ProjectStatus.success;
  bool get isError => this == ProjectStatus.error;
}

class ProjectState extends Equatable {
  final ProjectStatus status;
  final String? message;
  final String? errorMessage;
  final LanguageModel? fromLanguage;
  final LanguageModel? toLanguage;
  final int? days;
  final int? industryId;

  const ProjectState({
    this.status = ProjectStatus.initial,
    this.message,
    this.errorMessage,
    this.fromLanguage,
    this.toLanguage,
    this.days,
    this.industryId,
  });

  ProjectState copyWith({
    ProjectStatus? status,
    String? message,
    String? errorMessage,
    LanguageModel? fromLanguage,
    LanguageModel? toLanguage,
    int? days,
    int? industryId,
  }) {
    return ProjectState(
      status: status ?? this.status,
      message: message ?? this.message,
      errorMessage: errorMessage ?? this.errorMessage,
      fromLanguage: fromLanguage ?? this.fromLanguage,
      toLanguage: toLanguage ?? this.toLanguage,
      days: days ?? this.days,
      industryId: industryId ?? this.industryId,
    );
  }

  @override
  List<Object?> get props => [
        status,
        message,
        errorMessage,
        fromLanguage,
        toLanguage,
        days,
        industryId,
      ];
}
