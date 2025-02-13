import 'project_model.dart';

class ProjectResponseModel {
  final int pageIndex;
  final int pageSize;
  final int count;
  final List<ProjectModel> items;

  ProjectResponseModel({
    required this.pageIndex,
    required this.pageSize,
    required this.count,
    required this.items,
  });

  factory ProjectResponseModel.fromJson(Map<String, dynamic> json) {
    return ProjectResponseModel(
      pageIndex: json['pageIndex'],
      pageSize: json['pageSize'],
      count: json['count'],
      items: List<ProjectModel>.from(
        json['items'].map((x) => ProjectModel.fromJson(x)),
      ),
    );
  }
}
