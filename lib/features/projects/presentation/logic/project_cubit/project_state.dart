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

  const ProjectState({
    this.status = ProjectStatus.initial,
    this.message,
    this.errorMessage,
  });

  ProjectState copyWith({
    ProjectStatus? status,
    String? message,
    String? errorMessage,
  }) {
    return ProjectState(
      status: status ?? this.status,
      message: message ?? this.message,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, message, errorMessage];
}
